def contained(elem, list) :
    """
    return true if the element is contained in the list
    """
    if elem in "\n".join(list) :
        return True
    return False


def mass_category(mass) :
    """
    return the mass category depending on the value of mass. Currently we
    will have only one mass category for the pt sub-categorization.
    """
    # Temprorarily only use 1 mass cat.
    return 0
    value = float(mass)
    category = 0
    if 150<value and value<=250 :
        category = 0
    elif 250<value :
        category = 0
    return category

def is_integer(elem):
    try:
        int(elem)
    except ValueError:
        return False
    if abs(int(elem) - float(elem)) < 1e-6:
        return True
    return False

def parseArgs(args) :
    """
    parse a list of arguments which can be intergers or of type intA-intB
    where intA<=intB and fill this list of arguments into a list if ints
    """
    list = []
    for elem in args :
        if elem.find("-") > -1 :
            if elem.find(":") > -1 :
                step = float(elem[elem.find(":")+1:])
                min = float(elem[:elem.find("-")  ])
                max = float(elem[elem.find("-")+1:elem.find(":")])
            else :
                step = 1
                min = float(elem[:elem.find("-")  ])
                max = float(elem[elem.find("-")+1:])
            while min <= max :
                if is_integer(min):
                    list.append(int(min))
                else:
                    list.append(min)
                min=min+step
        else :
            if is_integer(elem):
                list.append(int(elem))
            else:
                list.append(elem)
    return list
