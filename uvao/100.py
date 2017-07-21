import logging

def GetDepth(number, tables):
    if number in tables:
        logging.info('{0} matched'.format(number))
        return tables[number]

    isOdd = (number % 2) == 1;
    nextNum = isOdd and (3 * number + 1) or (number / 2);

    depth = GetDepth(nextNum, tables) + 1;
    logging.info('{0} depth : {1}'.format(number, depth))

    tables[number] = depth
    return depth

def main(sampleInputs):
    tables = {1:1}
    for sampleInput in sampleInputs:
        depths = []
        begin, end = sampleInput
        for i in range(begin, end+1):
            depth = GetDepth(i, tables)
            depths.append(depth)
            logging.info("{0} {1}".format(i, depth))
        print "{0} {1} {2}".format(begin, end, max(depths))

if __name__ == '__main__':

    sampleInputs = (
        (1, 10),
        (100, 200),
        (201, 210),
        (900, 1000))

    main(sampleInputs)
