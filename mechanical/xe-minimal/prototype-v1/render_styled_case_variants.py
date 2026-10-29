"""Render the two styled case candidates from perspective and USB side."""
from pathlib import Path
import cadquery as cq
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.colors import to_rgb
from mpl_toolkits.mplot3d.art3d import Poly3DCollection

HERE = Path(__file__).resolve().parent
variants = [
    ("Soft R2.0", "soft-r20", "#cad3df"),
    ("Pebble R2.3", "pebble-r23", "#bfcddd"),
]


def triangles(shape, tolerance=.18):
    out = []
    for solid in shape.Solids():
        points, faces = solid.tessellate(tolerance)
        vertices = [(p.x, p.y, p.z) for p in points]
        out.extend([[vertices[j] for j in face] for face in faces])
    return np.asarray(out)


fig = plt.figure(figsize=(12, 10))
for col, (label, slug, color) in enumerate(variants):
    lower = cq.importers.importStep(str(HERE / f"case-{slug}-lower.step")).val()
    upper = cq.importers.importStep(str(HERE / f"case-{slug}-upper.step")).val()
    tri = triangles(cq.Compound.makeCompound([lower, upper]))
    normals = np.cross(tri[:, 1] - tri[:, 0], tri[:, 2] - tri[:, 0])
    normals /= np.maximum(np.linalg.norm(normals, axis=1)[:, None], 1e-12)
    light = np.array([.35, -.55, .75]); light /= np.linalg.norm(light)
    shade = .58 + .42 * np.abs(normals @ light)
    colors = np.array(to_rgb(color))[None, :] * shade[:, None]
    for row, (elev, azim, title) in enumerate([(25, -58, "Perspective"), (2, 90, "USB side")]):
        ax = fig.add_subplot(2, 2, row * 2 + col + 1, projection="3d")
        ax.add_collection3d(Poly3DCollection(tri, facecolors=colors, edgecolors="none", alpha=1))
        ax.set_xlim(-2, 27); ax.set_ylim(-30, 7); ax.set_zlim(-9, 7)
        ax.set_box_aspect((29, 37, 16)); ax.view_init(elev=elev, azim=azim)
        ax.set_axis_off(); ax.set_title(f"{label} - {title}", fontsize=13)

fig.suptitle("XE case styling and wide USB-C access studies", fontsize=18)
fig.text(.5, .025, "Fixed PCB/battery/sensor coordinates. 14 x 7.5 mm recessed outer bay, 9.4 x 3.6 mm connector throat. Not physically qualified.", ha="center", fontsize=10)
out = HERE / "styled-case-comparison.png"
fig.savefig(out, dpi=170, bbox_inches="tight")
plt.close(fig)
print(out)
