"""Render the pebble v2 case from views that expose the revised decisions."""
from pathlib import Path
import cadquery as cq
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.colors import to_rgb
from mpl_toolkits.mplot3d.art3d import Poly3DCollection

HERE = Path(__file__).resolve().parent


def triangles(shape, tolerance=.12):
    out = []
    for solid in shape.Solids():
        points, faces = solid.tessellate(tolerance)
        vertices = [(p.x, p.y, p.z) for p in points]
        out.extend([[vertices[j] for j in face] for face in faces])
    return np.asarray(out)


def add_shape(ax, shape, color, alpha=1.0):
    tri = triangles(shape)
    normals = np.cross(tri[:, 1] - tri[:, 0], tri[:, 2] - tri[:, 0])
    normals /= np.maximum(np.linalg.norm(normals, axis=1)[:, None], 1e-12)
    light = np.array([.35, -.55, .75])
    light /= np.linalg.norm(light)
    shade = .58 + .42 * np.abs(normals @ light)
    colors = np.array(to_rgb(color))[None, :] * shade[:, None]
    ax.add_collection3d(Poly3DCollection(tri, facecolors=colors, edgecolors="none", alpha=alpha))


lower = cq.importers.importStep(str(HERE / "case-pebble-v2-lower.step")).val()
upper = cq.importers.importStep(str(HERE / "case-pebble-v2-upper.step")).val()
internals = cq.importers.importStep(str(HERE / "integrated-assembly-v1.step")).val()

fig = plt.figure(figsize=(18, 5.7))
views = [
    (24, -58, "Perspective / all-edge rounding", False),
    (89.8, -90, "Plan / complete bail rotated 90°", False),
    (0, 0, "Bail side / 3.2 mm cord hole", False),
    (5, 90, "USB-C end / recessed wide bay", True),
]
for index, (elev, azim, title, show_internals) in enumerate(views, 1):
    ax = fig.add_subplot(1, 4, index, projection="3d")
    add_shape(ax, lower, "#9bacbf")
    add_shape(ax, upper, "#d1dae5", .82 if show_internals else 1.0)
    if show_internals:
        add_shape(ax, internals, "#3e8056", .75)
    ax.set_xlim(-2, 27)
    ax.set_ylim(-30, 9)
    ax.set_zlim(-9, 7)
    ax.set_box_aspect((29, 39, 16))
    ax.view_init(elev=elev, azim=azim)
    ax.set_axis_off()
    ax.set_title(title, fontsize=12)

fig.suptitle("XE Pebble v2 — transverse lanyard slot, print-oriented integral lug", fontsize=17)
fig.text(
    .5, .025,
    "R3 plan corners + R1.5 top/bottom edges · lug carried by lower print · 14 × 7.5 mm USB cable bay · not physically qualified",
    ha="center", fontsize=10,
)
out = HERE / "pebble-case-v2-review.png"
fig.savefig(out, dpi=180, bbox_inches="tight")
plt.close(fig)
print(out)
