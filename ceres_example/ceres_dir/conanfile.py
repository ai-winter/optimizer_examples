from email.policy import default
from conan import ConanFile
from conan.tools.cmake import cmake_layout


class ExampleRecipe(ConanFile):
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeDeps", "CMakeToolchain", "cmake_find_package", "cmake"
    
    def configure(self):
        self.options["ceres-solver"].shared = True
        self.options["ceres-solver"].use_glog = True
        self.options["glog"].shared = True
        self.options["glog"].with_threads = True
        self.options["gflags"].shared = True

    def requirements(self):
        self.requires("ceres-solver/1.14.0")

    def layout(self):
        cmake_layout(self)