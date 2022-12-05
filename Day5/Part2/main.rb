
def main()
    $input = File.read("input.txt").split("\n\n")

    stacksStr = $input[0].split("\n")
    $stacks = []
    $proc = $input[1].split("\n")
    $charIndex = []

    c = 0
    stacksStr[stacksStr.length-2].sub("\n", "").split("").each{ |char|
        if char.match(/[A-Z]/)
            $charIndex.push(c)
        end
        c += 1
    }
    for i in $charIndex do
        col = []
        max = stacksStr.length - 2
        for j in 0..max do
            if stacksStr[max - j].sub("\n", "").split("")[i] != " "
                col.push(stacksStr[max - j].sub("\n", "").split("")[i])
            end
        end
        $stacks.push(col)
    end
    for task in $proc do
        taskList = task.split(" ")
        amount = taskList[1].to_i
        from = taskList[3].to_i-1
        to = taskList[5].to_i-1
        crates = $stacks[from].pop(amount)
        for crate in crates do
            $stacks[to].push(crate)
        end
    end
    for s in $stacks do
        print s[-1]
    end
end

if __FILE__ == $0
    main()
end