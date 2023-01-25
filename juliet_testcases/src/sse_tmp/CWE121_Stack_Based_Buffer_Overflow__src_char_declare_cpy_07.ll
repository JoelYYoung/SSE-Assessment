; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !28
  store i8* %arraydecay, i8** %data, align 8, !dbg !29
  %0 = load i32, i32* @staticFive, align 4, !dbg !30
  %cmp = icmp eq i32 %0, 5, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !36
  %2 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !45
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !46
  %4 = load i8*, i8** %data, align 8, !dbg !47
  %call = call i8* @strcpy(i8* %arraydecay1, i8* %4) #5, !dbg !48
  %5 = load i8*, i8** %data, align 8, !dbg !49
  call void @printLine(i8* %5), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_07_good() #0 !dbg !52 {
entry:
  call void @goodG2B1(), !dbg !53
  call void @goodG2B2(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #5, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #5, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_07_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_07_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !79
  store i8* %arraydecay, i8** %data, align 8, !dbg !80
  %0 = load i32, i32* @staticFive, align 4, !dbg !81
  %cmp = icmp ne i32 %0, 5, !dbg !83
  br i1 %cmp, label %if.then, label %if.else, !dbg !84

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !85
  br label %if.end, !dbg !87

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !90
  %2 = load i8*, i8** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !93, metadata !DIExpression()), !dbg !95
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !95
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !96
  %4 = load i8*, i8** %data, align 8, !dbg !97
  %call = call i8* @strcpy(i8* %arraydecay1, i8* %4) #5, !dbg !98
  %5 = load i8*, i8** %data, align 8, !dbg !99
  call void @printLine(i8* %5), !dbg !100
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !102 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !107
  store i8* %arraydecay, i8** %data, align 8, !dbg !108
  %0 = load i32, i32* @staticFive, align 4, !dbg !109
  %cmp = icmp eq i32 %0, 5, !dbg !111
  br i1 %cmp, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !115
  %2 = load i8*, i8** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  br label %if.end, !dbg !118

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !119, metadata !DIExpression()), !dbg !121
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !121
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !122
  %4 = load i8*, i8** %data, align 8, !dbg !123
  %call = call i8* @strcpy(i8* %arraydecay1, i8* %4) #5, !dbg !124
  %5 = load i8*, i8** %data, align 8, !dbg !125
  call void @printLine(i8* %5), !dbg !126
  ret void, !dbg !127
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_07_bad", scope: !8, file: !8, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !DILocation(line: 31, column: 12, scope: !16)
!23 = !DILocalVariable(name: "dataBuffer", scope: !16, file: !8, line: 32, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 800, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 100)
!27 = !DILocation(line: 32, column: 10, scope: !16)
!28 = !DILocation(line: 33, column: 12, scope: !16)
!29 = !DILocation(line: 33, column: 10, scope: !16)
!30 = !DILocation(line: 34, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !16, file: !8, line: 34, column: 8)
!32 = !DILocation(line: 34, column: 18, scope: !31)
!33 = !DILocation(line: 34, column: 8, scope: !16)
!34 = !DILocation(line: 37, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !8, line: 35, column: 5)
!36 = !DILocation(line: 37, column: 9, scope: !35)
!37 = !DILocation(line: 38, column: 9, scope: !35)
!38 = !DILocation(line: 38, column: 21, scope: !35)
!39 = !DILocation(line: 39, column: 5, scope: !35)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !8, line: 41, type: !42)
!41 = distinct !DILexicalBlock(scope: !16, file: !8, line: 40, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 400, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 50)
!45 = !DILocation(line: 41, column: 14, scope: !41)
!46 = !DILocation(line: 43, column: 16, scope: !41)
!47 = !DILocation(line: 43, column: 22, scope: !41)
!48 = !DILocation(line: 43, column: 9, scope: !41)
!49 = !DILocation(line: 44, column: 19, scope: !41)
!50 = !DILocation(line: 44, column: 9, scope: !41)
!51 = !DILocation(line: 46, column: 1, scope: !16)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_07_good", scope: !8, file: !8, line: 97, type: !17, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DILocation(line: 99, column: 5, scope: !52)
!54 = !DILocation(line: 100, column: 5, scope: !52)
!55 = !DILocation(line: 101, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 113, type: !57, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DISubroutineType(types: !58)
!58 = !{!9, !9, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !8, line: 113, type: !9)
!61 = !DILocation(line: 113, column: 14, scope: !56)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !8, line: 113, type: !59)
!63 = !DILocation(line: 113, column: 27, scope: !56)
!64 = !DILocation(line: 116, column: 22, scope: !56)
!65 = !DILocation(line: 116, column: 12, scope: !56)
!66 = !DILocation(line: 116, column: 5, scope: !56)
!67 = !DILocation(line: 118, column: 5, scope: !56)
!68 = !DILocation(line: 119, column: 5, scope: !56)
!69 = !DILocation(line: 120, column: 5, scope: !56)
!70 = !DILocation(line: 123, column: 5, scope: !56)
!71 = !DILocation(line: 124, column: 5, scope: !56)
!72 = !DILocation(line: 125, column: 5, scope: !56)
!73 = !DILocation(line: 127, column: 5, scope: !56)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 53, type: !17, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DILocalVariable(name: "data", scope: !74, file: !8, line: 55, type: !20)
!76 = !DILocation(line: 55, column: 12, scope: !74)
!77 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !8, line: 56, type: !24)
!78 = !DILocation(line: 56, column: 10, scope: !74)
!79 = !DILocation(line: 57, column: 12, scope: !74)
!80 = !DILocation(line: 57, column: 10, scope: !74)
!81 = !DILocation(line: 58, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !74, file: !8, line: 58, column: 8)
!83 = !DILocation(line: 58, column: 18, scope: !82)
!84 = !DILocation(line: 58, column: 8, scope: !74)
!85 = !DILocation(line: 61, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !8, line: 59, column: 5)
!87 = !DILocation(line: 62, column: 5, scope: !86)
!88 = !DILocation(line: 66, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !82, file: !8, line: 64, column: 5)
!90 = !DILocation(line: 66, column: 9, scope: !89)
!91 = !DILocation(line: 67, column: 9, scope: !89)
!92 = !DILocation(line: 67, column: 20, scope: !89)
!93 = !DILocalVariable(name: "dest", scope: !94, file: !8, line: 70, type: !42)
!94 = distinct !DILexicalBlock(scope: !74, file: !8, line: 69, column: 5)
!95 = !DILocation(line: 70, column: 14, scope: !94)
!96 = !DILocation(line: 72, column: 16, scope: !94)
!97 = !DILocation(line: 72, column: 22, scope: !94)
!98 = !DILocation(line: 72, column: 9, scope: !94)
!99 = !DILocation(line: 73, column: 19, scope: !94)
!100 = !DILocation(line: 73, column: 9, scope: !94)
!101 = !DILocation(line: 75, column: 1, scope: !74)
!102 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 78, type: !17, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!103 = !DILocalVariable(name: "data", scope: !102, file: !8, line: 80, type: !20)
!104 = !DILocation(line: 80, column: 12, scope: !102)
!105 = !DILocalVariable(name: "dataBuffer", scope: !102, file: !8, line: 81, type: !24)
!106 = !DILocation(line: 81, column: 10, scope: !102)
!107 = !DILocation(line: 82, column: 12, scope: !102)
!108 = !DILocation(line: 82, column: 10, scope: !102)
!109 = !DILocation(line: 83, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !102, file: !8, line: 83, column: 8)
!111 = !DILocation(line: 83, column: 18, scope: !110)
!112 = !DILocation(line: 83, column: 8, scope: !102)
!113 = !DILocation(line: 86, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !8, line: 84, column: 5)
!115 = !DILocation(line: 86, column: 9, scope: !114)
!116 = !DILocation(line: 87, column: 9, scope: !114)
!117 = !DILocation(line: 87, column: 20, scope: !114)
!118 = !DILocation(line: 88, column: 5, scope: !114)
!119 = !DILocalVariable(name: "dest", scope: !120, file: !8, line: 90, type: !42)
!120 = distinct !DILexicalBlock(scope: !102, file: !8, line: 89, column: 5)
!121 = !DILocation(line: 90, column: 14, scope: !120)
!122 = !DILocation(line: 92, column: 16, scope: !120)
!123 = !DILocation(line: 92, column: 22, scope: !120)
!124 = !DILocation(line: 92, column: 9, scope: !120)
!125 = !DILocation(line: 93, column: 19, scope: !120)
!126 = !DILocation(line: 93, column: 9, scope: !120)
!127 = !DILocation(line: 95, column: 1, scope: !102)
