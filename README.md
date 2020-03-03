## Enigma Individual Project
----
### Self-Assessment

- **Functionality: 3**

  While there were a couple places where I would have liked to do more, particularly in the runner files, I completed all of the required functionality and was able to do it in a concise and readable manner.

- **OOP: 3/4**

  While it would have been possible to reduce the Enigma class even further into constituent parts, I felt that this level of granularity made sense, and any more would be overkill. The methods pertaining to obtaining the shifts for each key section were extracted into a module, Shiftable. I feel that the specific function of the Shiftable module is clear, however, I don't think it's the most practical usage of the tool.

- **Ruby Conventions and Mechanics: 4**

  It's difficult to see if the names I've chosen are readable or not without the opinion of another person, but I think that overall the code isn't hard to read. As far as I know, everything is properly indented and within acceptable line lengths. The enumerables I've chosen are what seems like the best choices, particularly the each_cons that I use in my Shiftable.key_shifts method, because it simplifies the code, and does essentially exactly what I'm looking for.

- **Test-Driven Development: 2**

  This one's mostly on a technicality. While I used stubs in what seems to be great use cases, generally robust tests, and 100% test coverage, I neglected to keep my test and implementation git commits separate, and as such my git history does not reflect test-first development.

- **Version Control: 3**

  Every commit holds only one piece of functionality, and was made after every passing test. There are 30 (31 including this file!) commits and 6 pull requests on github, and each pull request contains a different and specific category of functionality.
