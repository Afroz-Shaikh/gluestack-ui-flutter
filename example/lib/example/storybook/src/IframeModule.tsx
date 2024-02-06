import React from "react";
import SyntaxHighlighter from "react-syntax-highlighter";
import { docco } from "react-syntax-highlighter/dist/esm/styles/hljs";
interface IframeProps {
  src: string;
  title: string;
  height: string;
  code: string;
}

const IframeModule: React.FC<IframeProps> = ({ src, title, height, code }) => {
  return (
    <div
      className="ButtonPreview"
      style={{
        border: "0.3px solid #404040",
        borderRadius: "12px",
        padding: "3px",
        height: height,
      }}
    >
      <iframe
        src={src}
        title={title}
        width="100%"
        height="400"
        style={{ border: "none", padding: "none" }}
      ></iframe>
      <SyntaxHighlighter language="javascript" style={docco}>
        {code}
      </SyntaxHighlighter>
    </div>
  );
};

export default IframeModule;
