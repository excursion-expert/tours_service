import React from 'react';
import styled from 'styled-components';

const StyledTab = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  padding: 20px;
  border: 1px solid lightgray;
  border-right-width: ${props => props.name !== 'Browse' ? 0 : 1};
  border-bottom-width: ${props => props.selected ? 0: 1};
  border-top: ${props => props.selected ? '2px solid black' : '1px solid lightgray'};
  text-align: center;
  height: 50px;
  flex: 1 1 16.66%;
`;
StyledTab.displayName = "StyledTab";

const StyledSpan = styled.span`
  font-weight: 500;
`

const Tab = (props) => {
  const handleClick = () => {
    props.updateView(props.tabNumber);
  }

  return (
    <StyledTab
      selected={props.selected}
      name={props.name}
      onClick={handleClick}
    >
      {props.name !== 'Browse' ? 
        <span>
          <StyledSpan>{props.name}</StyledSpan> <br />
          {props.description}
        </span>
        : 
        <StyledSpan>
          ... <br />
          {props.name} <br />
          <br />
        </StyledSpan>
      }
    </StyledTab>
  )
}

export default Tab;