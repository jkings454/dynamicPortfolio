# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
project_groups = ProjectGroup.create([{ 
    title: "Marketing 1030",
    description: "All of my projects for the Marketing 1030 class.",
    image_url: "marketing.jpg",
    }, 
  {
    title: "Computer Science 1030",
    description: "Every little bit of code I wrote for Computer Science 1030",
    image_url: "abacus.jpg",
    }])
projects = Project.create([{
      name: "Simple Math",
      link: "https://www.dropbox.com/s/vzly8a4mqf9vwtq/SimpleMath.java?dl=0",
      description: "A simple math program written for computer science 1030. This program is pretty straightforward,
      you simply insert a few numbers and statistics about those numbers are returned.",
      link_type: "download",
      project_group_id: 2,
      },
    {
      name: "My First Program",
      link: "https://www.dropbox.com/s/x7nxpsadwswqfi1/MyFirstProgram.java?dl=0",
      description: "Despite the title, this isn't actually my first program, that's just the name of the particular project.",
      link_type: "download",
      project_group_id: 2,
    }])