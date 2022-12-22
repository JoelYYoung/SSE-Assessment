; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_07_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %0 = load i32, i32* @staticFive, align 4, !dbg !34
  %cmp = icmp eq i32 %0, 5, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i32* %arraydecay, i32** %data, align 8, !dbg !40
  %1 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !44, metadata !DIExpression()), !dbg !46
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_07_bad.source to i8*), i64 44, i1 false), !dbg !46
  %3 = load i32*, i32** %data, align 8, !dbg !47
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !48
  %call = call i32* @wcscpy(i32* %3, i32* %arraydecay1) #5, !dbg !49
  %4 = load i32*, i32** %data, align 8, !dbg !50
  call void @printWLine(i32* %4), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_07_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #5, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #5, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_07_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_07_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = load i32, i32* @staticFive, align 4, !dbg !84
  %cmp = icmp ne i32 %0, 5, !dbg !86
  br i1 %cmp, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end, !dbg !90

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !91
  store i32* %arraydecay, i32** %data, align 8, !dbg !93
  %1 = load i32*, i32** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !94
  store i32 0, i32* %arrayidx, align 4, !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !96, metadata !DIExpression()), !dbg !98
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !98
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !98
  %3 = load i32*, i32** %data, align 8, !dbg !99
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !100
  %call = call i32* @wcscpy(i32* %3, i32* %arraydecay1) #5, !dbg !101
  %4 = load i32*, i32** %data, align 8, !dbg !102
  call void @printWLine(i32* %4), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %0 = load i32, i32* @staticFive, align 4, !dbg !112
  %cmp = icmp eq i32 %0, 5, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !116
  store i32* %arraydecay, i32** %data, align 8, !dbg !118
  %1 = load i32*, i32** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !119
  store i32 0, i32* %arrayidx, align 4, !dbg !120
  br label %if.end, !dbg !121

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !122, metadata !DIExpression()), !dbg !124
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !124
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !124
  %3 = load i32*, i32** %data, align 8, !dbg !125
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !126
  %call = call i32* @wcscpy(i32* %3, i32* %arraydecay1) #5, !dbg !127
  %4 = load i32*, i32** %data, align 8, !dbg !128
  call void @printWLine(i32* %4), !dbg !129
  ret void, !dbg !130
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 30, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_07.c", directory: "/root/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_07_bad", scope: !8, file: !8, line: 34, type: !17, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 36, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !22, line: 74, baseType: !9)
!22 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!23 = !DILocation(line: 36, column: 15, scope: !16)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !16, file: !8, line: 37, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 37, column: 13, scope: !16)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !16, file: !8, line: 38, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 352, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 11)
!33 = !DILocation(line: 38, column: 13, scope: !16)
!34 = !DILocation(line: 39, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !16, file: !8, line: 39, column: 8)
!36 = !DILocation(line: 39, column: 18, scope: !35)
!37 = !DILocation(line: 39, column: 8, scope: !16)
!38 = !DILocation(line: 43, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !8, line: 40, column: 5)
!40 = !DILocation(line: 43, column: 14, scope: !39)
!41 = !DILocation(line: 44, column: 9, scope: !39)
!42 = !DILocation(line: 44, column: 17, scope: !39)
!43 = !DILocation(line: 45, column: 5, scope: !39)
!44 = !DILocalVariable(name: "source", scope: !45, file: !8, line: 47, type: !30)
!45 = distinct !DILexicalBlock(scope: !16, file: !8, line: 46, column: 5)
!46 = !DILocation(line: 47, column: 17, scope: !45)
!47 = !DILocation(line: 49, column: 16, scope: !45)
!48 = !DILocation(line: 49, column: 22, scope: !45)
!49 = !DILocation(line: 49, column: 9, scope: !45)
!50 = !DILocation(line: 50, column: 20, scope: !45)
!51 = !DILocation(line: 50, column: 9, scope: !45)
!52 = !DILocation(line: 52, column: 1, scope: !16)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_07_good", scope: !8, file: !8, line: 105, type: !17, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DILocation(line: 107, column: 5, scope: !53)
!55 = !DILocation(line: 108, column: 5, scope: !53)
!56 = !DILocation(line: 109, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 121, type: !58, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DISubroutineType(types: !59)
!59 = !{!9, !9, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !8, line: 121, type: !9)
!64 = !DILocation(line: 121, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !8, line: 121, type: !60)
!66 = !DILocation(line: 121, column: 27, scope: !57)
!67 = !DILocation(line: 124, column: 22, scope: !57)
!68 = !DILocation(line: 124, column: 12, scope: !57)
!69 = !DILocation(line: 124, column: 5, scope: !57)
!70 = !DILocation(line: 126, column: 5, scope: !57)
!71 = !DILocation(line: 127, column: 5, scope: !57)
!72 = !DILocation(line: 128, column: 5, scope: !57)
!73 = !DILocation(line: 131, column: 5, scope: !57)
!74 = !DILocation(line: 132, column: 5, scope: !57)
!75 = !DILocation(line: 133, column: 5, scope: !57)
!76 = !DILocation(line: 135, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 59, type: !17, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DILocalVariable(name: "data", scope: !77, file: !8, line: 61, type: !20)
!79 = !DILocation(line: 61, column: 15, scope: !77)
!80 = !DILocalVariable(name: "dataBadBuffer", scope: !77, file: !8, line: 62, type: !25)
!81 = !DILocation(line: 62, column: 13, scope: !77)
!82 = !DILocalVariable(name: "dataGoodBuffer", scope: !77, file: !8, line: 63, type: !30)
!83 = !DILocation(line: 63, column: 13, scope: !77)
!84 = !DILocation(line: 64, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !77, file: !8, line: 64, column: 8)
!86 = !DILocation(line: 64, column: 18, scope: !85)
!87 = !DILocation(line: 64, column: 8, scope: !77)
!88 = !DILocation(line: 67, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !8, line: 65, column: 5)
!90 = !DILocation(line: 68, column: 5, scope: !89)
!91 = !DILocation(line: 73, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !8, line: 70, column: 5)
!93 = !DILocation(line: 73, column: 14, scope: !92)
!94 = !DILocation(line: 74, column: 9, scope: !92)
!95 = !DILocation(line: 74, column: 17, scope: !92)
!96 = !DILocalVariable(name: "source", scope: !97, file: !8, line: 77, type: !30)
!97 = distinct !DILexicalBlock(scope: !77, file: !8, line: 76, column: 5)
!98 = !DILocation(line: 77, column: 17, scope: !97)
!99 = !DILocation(line: 79, column: 16, scope: !97)
!100 = !DILocation(line: 79, column: 22, scope: !97)
!101 = !DILocation(line: 79, column: 9, scope: !97)
!102 = !DILocation(line: 80, column: 20, scope: !97)
!103 = !DILocation(line: 80, column: 9, scope: !97)
!104 = !DILocation(line: 82, column: 1, scope: !77)
!105 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 85, type: !17, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DILocalVariable(name: "data", scope: !105, file: !8, line: 87, type: !20)
!107 = !DILocation(line: 87, column: 15, scope: !105)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !8, line: 88, type: !25)
!109 = !DILocation(line: 88, column: 13, scope: !105)
!110 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !8, line: 89, type: !30)
!111 = !DILocation(line: 89, column: 13, scope: !105)
!112 = !DILocation(line: 90, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !105, file: !8, line: 90, column: 8)
!114 = !DILocation(line: 90, column: 18, scope: !113)
!115 = !DILocation(line: 90, column: 8, scope: !105)
!116 = !DILocation(line: 94, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !8, line: 91, column: 5)
!118 = !DILocation(line: 94, column: 14, scope: !117)
!119 = !DILocation(line: 95, column: 9, scope: !117)
!120 = !DILocation(line: 95, column: 17, scope: !117)
!121 = !DILocation(line: 96, column: 5, scope: !117)
!122 = !DILocalVariable(name: "source", scope: !123, file: !8, line: 98, type: !30)
!123 = distinct !DILexicalBlock(scope: !105, file: !8, line: 97, column: 5)
!124 = !DILocation(line: 98, column: 17, scope: !123)
!125 = !DILocation(line: 100, column: 16, scope: !123)
!126 = !DILocation(line: 100, column: 22, scope: !123)
!127 = !DILocation(line: 100, column: 9, scope: !123)
!128 = !DILocation(line: 101, column: 20, scope: !123)
!129 = !DILocation(line: 101, column: 9, scope: !123)
!130 = !DILocation(line: 103, column: 1, scope: !105)
