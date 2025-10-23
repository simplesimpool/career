import { mainFrameElement, 
    rightBottomItemFrameElement, 
    rightItemBottomScrollBarElements, rightItemTopScrollBarElements, rightSideFrameElement }
 from "../../../../Model/Client/frame-data.js";

addItemScrollBarListeners();
addItemScrollListeners();

function addItemScrollBarListeners() {
    for(const bottomScrollBar of rightItemBottomScrollBarElements) {
        bottomScrollBar.addEventListener("mousedown", () => {
            startBottomHeightResize(bottomScrollBar);
        });
    }

    for(const topScrollBar of rightItemTopScrollBarElements) {
        topScrollBar.addEventListener("mousedown", () => {
            startTopHeightResize(topScrollBar);
        });
    }
}

function addItemScrollListeners() {
    for(const element of rightSideFrameElement.children) {
        element.addEventListener("scroll", () => {
            const topScrollBarPos = element.scrollTop;
            const bottomScrollBarPos = -element.scrollTop;

            for(const topScrollBar of rightItemTopScrollBarElements) {
                if(topScrollBar.parentElement === element) {
                    topScrollBar.style.top = `${topScrollBarPos}px`
                }
            }

            for(const BottomScrollBar of rightItemBottomScrollBarElements) {
                if(BottomScrollBar.parentElement === element) {
                    BottomScrollBar.style.bottom = `${bottomScrollBarPos}px`
                }
            }
        });
    }
}

function startTopHeightResize(ScrollBar) {
    let mouseMoveListener;
    let mouseUpListener;

    window.addEventListener("mousemove", mouseMoveListener = (event) => {
        resizeTopHeight(event, ScrollBar);
    });
    window.addEventListener("mouseup", mouseUpListener = () => {
        stopTopHeightResize(mouseMoveListener, mouseUpListener);
    });
}

function resizeTopHeight(event, ScrollBar) {
    const parentElement = ScrollBar.parentElement;
    const parentRect = parentElement.getBoundingClientRect();
    let upperElements = [];
    let minHeightCount = 0;

    for(const child of rightSideFrameElement.children) {
        const mainFrameHeight = mainFrameElement.getBoundingClientRect().height;
        const childStyle = window.getComputedStyle(child);
        const childHeight = child.getBoundingClientRect().height;
        const childMinHeightRatio = parseFloat(childStyle.getPropertyValue("min-height"));

        if(child === parentElement) {
            break;
        }
        else {
            if((childHeight / mainFrameHeight) * 100 <= childMinHeightRatio) {
                minHeightCount++;
            }
            upperElements.push(child)
        }
    }

    for(const element of upperElements) {
        const curElementHeight = element.getBoundingClientRect().height;
        const newElementHeight = curElementHeight + (event.movementY) / (upperElements.length - minHeightCount);
        element.style.height = `${newElementHeight}px`;
    }

    if(upperElements.length === minHeightCount) {//when the height of each upper elements is equal to the minimum height.
        if(event.movementY >= 0) {//whenever the mouse moves down
            for(const element of upperElements) {
                const curElementHeight = element.getBoundingClientRect().height;
                const newElementHeight = curElementHeight + (event.movementY);
                element.style.height = `${newElementHeight}px`;
            }
            parentElement.style.height = `${parentRect.height - event.movementY}px`;
        }
    }
    else {
        parentElement.style.height = `${parentRect.height - event.movementY}px`;
    }
  

    // }
    // fillRightBottomItemFrame();

    // function fillRightBottomItemFrame() {
    //     const length = rightSideFrameElement.children.length;
    //     const lastElement = rightSideFrameElement.children[length - 1];
    //     const lastElementRect = lastElement.getBoundingClientRect();
    //     const mainFrameElementRect = mainFrameElement.getBoundingClientRect();
    //     console.log(mainFrameElementRect.bottom - lastElementRect.bottom);

    //     if(mainFrameElementRect.bottom >= lastElementRect.bottom) {
    //         const diffHeight = parseInt(mainFrameElementRect.bottom - lastElementRect.bottom);
    //         lastElement.style.height = `${lastElementRect.height + diffHeight}px`;
    //         console.log("excuted!!!!");
    //     }
    // }
}

function stopTopHeightResize(...args) {
    window.removeEventListener("mousemove", args[0]);
    window.removeEventListener("mouseup", args[1]);
}

function startBottomHeightResize(ScrollBar) {//start each event listener when the mouse is pressed on the div
    let mouseMoveListener;
    let mouseUpListener;

    window.addEventListener("mousemove", mouseMoveListener = (event) => {
        resizeBottomHeight(event, ScrollBar);
    });
    window.addEventListener("mouseup", mouseUpListener = () => {
        stopBottomHeightResize(mouseMoveListener, mouseUpListener);
    });
}

function resizeBottomHeight(event, ScrollBar) {//resize a div while the mouse is moving
    const parentElement = ScrollBar.parentElement;
    const parentRect = parentElement.getBoundingClientRect();
    
    parentElement.style.height = `${parentRect.height + event.movementY}px`;


    // const elements = document.querySelectorAll(".asdfl");
    // if(elements.length != 0) {
    //     console.log("yes");
    //     console.log(elements)
    // }
    // fillRightBottomItemFrame();

    // function fillRightBottomItemFrame() {
    //     const length = rightSideFrameElement.children.length;
    //     const lastElement = rightSideFrameElement.children[length - 1];
    //     const lastElementRect = lastElement.getBoundingClientRect();
    //     const mainFrameElementRect = mainFrameElement.getBoundingClientRect();
    //     console.log(mainFrameElementRect.bottom - lastElementRect.bottom);

    //     if(mainFrameElementRect.bottom >= lastElementRect.bottom) {
    //         const diffHeight = parseInt(mainFrameElementRect.bottom - lastElementRect.bottom);
    //         lastElement.style.height = `${lastElementRect.height + diffHeight}px`;
    //         console.log("excuted!!!!");
    //     }
    // }
}
    
function stopBottomHeightResize(mouseMoveListener, mouseUpListener) {
    window.removeEventListener("mousemove", mouseMoveListener);
    window.removeEventListener("mouseup", mouseUpListener);
}