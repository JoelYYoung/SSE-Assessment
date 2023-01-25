; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_11.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_11_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_11_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %call = call i32 (...) @globalReturnsTrue(), !dbg !29
  %tobool = icmp ne i32 %call, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !32
  store i8* %arraydecay, i8** %data, align 8, !dbg !34
  %0 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !38, metadata !DIExpression()), !dbg !40
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !40
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_11_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !40
  %2 = load i8*, i8** %data, align 8, !dbg !41
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !42
  %call2 = call i8* @strcpy(i8* %2, i8* %arraydecay1) #5, !dbg !43
  %3 = load i8*, i8** %data, align 8, !dbg !44
  call void @printLine(i8* %3), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrue(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_11_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* null) #5, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #5, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_11_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_11_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !70 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i32 (...) @globalReturnsFalse(), !dbg !77
  %tobool = icmp ne i32 %call, 0, !dbg !77
  br i1 %tobool, label %if.then, label %if.else, !dbg !79

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !80
  br label %if.end, !dbg !82

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !83
  store i8* %arraydecay, i8** %data, align 8, !dbg !85
  %0 = load i8*, i8** %data, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !86
  store i8 0, i8* %arrayidx, align 1, !dbg !87
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !88, metadata !DIExpression()), !dbg !90
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !90
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !90
  %2 = load i8*, i8** %data, align 8, !dbg !91
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !92
  %call2 = call i8* @strcpy(i8* %2, i8* %arraydecay1) #5, !dbg !93
  %3 = load i8*, i8** %data, align 8, !dbg !94
  call void @printLine(i8* %3), !dbg !95
  ret void, !dbg !96
}

declare dso_local i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !97 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %call = call i32 (...) @globalReturnsTrue(), !dbg !104
  %tobool = icmp ne i32 %call, 0, !dbg !104
  br i1 %tobool, label %if.then, label %if.end, !dbg !106

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !107
  store i8* %arraydecay, i8** %data, align 8, !dbg !109
  %0 = load i8*, i8** %data, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !110
  store i8 0, i8* %arrayidx, align 1, !dbg !111
  br label %if.end, !dbg !112

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !113, metadata !DIExpression()), !dbg !115
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !115
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !115
  %2 = load i8*, i8** %data, align 8, !dbg !116
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !117
  %call2 = call i8* @strcpy(i8* %2, i8* %arraydecay1) #5, !dbg !118
  %3 = load i8*, i8** %data, align 8, !dbg !119
  call void @printLine(i8* %3), !dbg !120
  ret void, !dbg !121
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_11.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_11_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_11.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 30, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 80, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 10)
!23 = !DILocation(line: 31, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 88, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 11)
!28 = !DILocation(line: 32, column: 10, scope: !11)
!29 = !DILocation(line: 33, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 8)
!31 = !DILocation(line: 33, column: 8, scope: !11)
!32 = !DILocation(line: 37, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !12, line: 34, column: 5)
!34 = !DILocation(line: 37, column: 14, scope: !33)
!35 = !DILocation(line: 38, column: 9, scope: !33)
!36 = !DILocation(line: 38, column: 17, scope: !33)
!37 = !DILocation(line: 39, column: 5, scope: !33)
!38 = !DILocalVariable(name: "source", scope: !39, file: !12, line: 41, type: !25)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!40 = !DILocation(line: 41, column: 14, scope: !39)
!41 = !DILocation(line: 43, column: 16, scope: !39)
!42 = !DILocation(line: 43, column: 22, scope: !39)
!43 = !DILocation(line: 43, column: 9, scope: !39)
!44 = !DILocation(line: 44, column: 19, scope: !39)
!45 = !DILocation(line: 44, column: 9, scope: !39)
!46 = !DILocation(line: 46, column: 1, scope: !11)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_11_good", scope: !12, file: !12, line: 99, type: !13, scopeLine: 100, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 101, column: 5, scope: !47)
!49 = !DILocation(line: 102, column: 5, scope: !47)
!50 = !DILocation(line: 103, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 115, type: !52, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !12, line: 115, type: !54)
!57 = !DILocation(line: 115, column: 14, scope: !51)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !12, line: 115, type: !55)
!59 = !DILocation(line: 115, column: 27, scope: !51)
!60 = !DILocation(line: 118, column: 22, scope: !51)
!61 = !DILocation(line: 118, column: 12, scope: !51)
!62 = !DILocation(line: 118, column: 5, scope: !51)
!63 = !DILocation(line: 120, column: 5, scope: !51)
!64 = !DILocation(line: 121, column: 5, scope: !51)
!65 = !DILocation(line: 122, column: 5, scope: !51)
!66 = !DILocation(line: 125, column: 5, scope: !51)
!67 = !DILocation(line: 126, column: 5, scope: !51)
!68 = !DILocation(line: 127, column: 5, scope: !51)
!69 = !DILocation(line: 129, column: 5, scope: !51)
!70 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "data", scope: !70, file: !12, line: 55, type: !16)
!72 = !DILocation(line: 55, column: 12, scope: !70)
!73 = !DILocalVariable(name: "dataBadBuffer", scope: !70, file: !12, line: 56, type: !20)
!74 = !DILocation(line: 56, column: 10, scope: !70)
!75 = !DILocalVariable(name: "dataGoodBuffer", scope: !70, file: !12, line: 57, type: !25)
!76 = !DILocation(line: 57, column: 10, scope: !70)
!77 = !DILocation(line: 58, column: 8, scope: !78)
!78 = distinct !DILexicalBlock(scope: !70, file: !12, line: 58, column: 8)
!79 = !DILocation(line: 58, column: 8, scope: !70)
!80 = !DILocation(line: 61, column: 9, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !12, line: 59, column: 5)
!82 = !DILocation(line: 62, column: 5, scope: !81)
!83 = !DILocation(line: 67, column: 16, scope: !84)
!84 = distinct !DILexicalBlock(scope: !78, file: !12, line: 64, column: 5)
!85 = !DILocation(line: 67, column: 14, scope: !84)
!86 = !DILocation(line: 68, column: 9, scope: !84)
!87 = !DILocation(line: 68, column: 17, scope: !84)
!88 = !DILocalVariable(name: "source", scope: !89, file: !12, line: 71, type: !25)
!89 = distinct !DILexicalBlock(scope: !70, file: !12, line: 70, column: 5)
!90 = !DILocation(line: 71, column: 14, scope: !89)
!91 = !DILocation(line: 73, column: 16, scope: !89)
!92 = !DILocation(line: 73, column: 22, scope: !89)
!93 = !DILocation(line: 73, column: 9, scope: !89)
!94 = !DILocation(line: 74, column: 19, scope: !89)
!95 = !DILocation(line: 74, column: 9, scope: !89)
!96 = !DILocation(line: 76, column: 1, scope: !70)
!97 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 81, type: !16)
!99 = !DILocation(line: 81, column: 12, scope: !97)
!100 = !DILocalVariable(name: "dataBadBuffer", scope: !97, file: !12, line: 82, type: !20)
!101 = !DILocation(line: 82, column: 10, scope: !97)
!102 = !DILocalVariable(name: "dataGoodBuffer", scope: !97, file: !12, line: 83, type: !25)
!103 = !DILocation(line: 83, column: 10, scope: !97)
!104 = !DILocation(line: 84, column: 8, scope: !105)
!105 = distinct !DILexicalBlock(scope: !97, file: !12, line: 84, column: 8)
!106 = !DILocation(line: 84, column: 8, scope: !97)
!107 = !DILocation(line: 88, column: 16, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !12, line: 85, column: 5)
!109 = !DILocation(line: 88, column: 14, scope: !108)
!110 = !DILocation(line: 89, column: 9, scope: !108)
!111 = !DILocation(line: 89, column: 17, scope: !108)
!112 = !DILocation(line: 90, column: 5, scope: !108)
!113 = !DILocalVariable(name: "source", scope: !114, file: !12, line: 92, type: !25)
!114 = distinct !DILexicalBlock(scope: !97, file: !12, line: 91, column: 5)
!115 = !DILocation(line: 92, column: 14, scope: !114)
!116 = !DILocation(line: 94, column: 16, scope: !114)
!117 = !DILocation(line: 94, column: 22, scope: !114)
!118 = !DILocation(line: 94, column: 9, scope: !114)
!119 = !DILocation(line: 95, column: 19, scope: !114)
!120 = !DILocation(line: 95, column: 9, scope: !114)
!121 = !DILocation(line: 97, column: 1, scope: !97)
