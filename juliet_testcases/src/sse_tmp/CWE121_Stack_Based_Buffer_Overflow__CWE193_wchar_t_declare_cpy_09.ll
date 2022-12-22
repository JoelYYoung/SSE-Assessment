; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_09.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_09_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_09_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !31
  %tobool = icmp ne i32 %0, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !36
  %1 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !42
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !42
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_09_bad.source to i8*), i64 44, i1 false), !dbg !42
  %3 = load i32*, i32** %data, align 8, !dbg !43
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !44
  %call = call i32* @wcscpy(i32* %3, i32* %arraydecay1) #5, !dbg !45
  %4 = load i32*, i32** %data, align 8, !dbg !46
  call void @printWLine(i32* %4), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_09_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #5, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #5, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_09_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_09_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !80
  %tobool = icmp ne i32 %0, 0, !dbg !80
  br i1 %tobool, label %if.then, label %if.else, !dbg !82

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !83
  br label %if.end, !dbg !85

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !86
  store i32* %arraydecay, i32** %data, align 8, !dbg !88
  %1 = load i32*, i32** %data, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !89
  store i32 0, i32* %arrayidx, align 4, !dbg !90
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !91, metadata !DIExpression()), !dbg !93
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !93
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !93
  %3 = load i32*, i32** %data, align 8, !dbg !94
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !95
  %call = call i32* @wcscpy(i32* %3, i32* %arraydecay1) #5, !dbg !96
  %4 = load i32*, i32** %data, align 8, !dbg !97
  call void @printWLine(i32* %4), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !100 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !107
  %tobool = icmp ne i32 %0, 0, !dbg !107
  br i1 %tobool, label %if.then, label %if.end, !dbg !109

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !110
  store i32* %arraydecay, i32** %data, align 8, !dbg !112
  %1 = load i32*, i32** %data, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !113
  store i32 0, i32* %arrayidx, align 4, !dbg !114
  br label %if.end, !dbg !115

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !116, metadata !DIExpression()), !dbg !118
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !118
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !118
  %3 = load i32*, i32** %data, align 8, !dbg !119
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !120
  %call = call i32* @wcscpy(i32* %3, i32* %arraydecay1) #5, !dbg !121
  %4 = load i32*, i32** %data, align 8, !dbg !122
  call void @printWLine(i32* %4), !dbg !123
  ret void, !dbg !124
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_09.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_09_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_09.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 30, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 10)
!25 = !DILocation(line: 31, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 352, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 11)
!30 = !DILocation(line: 32, column: 13, scope: !11)
!31 = !DILocation(line: 33, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 8)
!33 = !DILocation(line: 33, column: 8, scope: !11)
!34 = !DILocation(line: 37, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !12, line: 34, column: 5)
!36 = !DILocation(line: 37, column: 14, scope: !35)
!37 = !DILocation(line: 38, column: 9, scope: !35)
!38 = !DILocation(line: 38, column: 17, scope: !35)
!39 = !DILocation(line: 39, column: 5, scope: !35)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 41, type: !27)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!42 = !DILocation(line: 41, column: 17, scope: !41)
!43 = !DILocation(line: 43, column: 16, scope: !41)
!44 = !DILocation(line: 43, column: 22, scope: !41)
!45 = !DILocation(line: 43, column: 9, scope: !41)
!46 = !DILocation(line: 44, column: 20, scope: !41)
!47 = !DILocation(line: 44, column: 9, scope: !41)
!48 = !DILocation(line: 46, column: 1, scope: !11)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_09_good", scope: !12, file: !12, line: 99, type: !13, scopeLine: 100, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 101, column: 5, scope: !49)
!51 = !DILocation(line: 102, column: 5, scope: !49)
!52 = !DILocation(line: 103, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 115, type: !54, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!19, !19, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !12, line: 115, type: !19)
!60 = !DILocation(line: 115, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !12, line: 115, type: !56)
!62 = !DILocation(line: 115, column: 27, scope: !53)
!63 = !DILocation(line: 118, column: 22, scope: !53)
!64 = !DILocation(line: 118, column: 12, scope: !53)
!65 = !DILocation(line: 118, column: 5, scope: !53)
!66 = !DILocation(line: 120, column: 5, scope: !53)
!67 = !DILocation(line: 121, column: 5, scope: !53)
!68 = !DILocation(line: 122, column: 5, scope: !53)
!69 = !DILocation(line: 125, column: 5, scope: !53)
!70 = !DILocation(line: 126, column: 5, scope: !53)
!71 = !DILocation(line: 127, column: 5, scope: !53)
!72 = !DILocation(line: 129, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !12, line: 55, type: !16)
!75 = !DILocation(line: 55, column: 15, scope: !73)
!76 = !DILocalVariable(name: "dataBadBuffer", scope: !73, file: !12, line: 56, type: !22)
!77 = !DILocation(line: 56, column: 13, scope: !73)
!78 = !DILocalVariable(name: "dataGoodBuffer", scope: !73, file: !12, line: 57, type: !27)
!79 = !DILocation(line: 57, column: 13, scope: !73)
!80 = !DILocation(line: 58, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !73, file: !12, line: 58, column: 8)
!82 = !DILocation(line: 58, column: 8, scope: !73)
!83 = !DILocation(line: 61, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !12, line: 59, column: 5)
!85 = !DILocation(line: 62, column: 5, scope: !84)
!86 = !DILocation(line: 67, column: 16, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !12, line: 64, column: 5)
!88 = !DILocation(line: 67, column: 14, scope: !87)
!89 = !DILocation(line: 68, column: 9, scope: !87)
!90 = !DILocation(line: 68, column: 17, scope: !87)
!91 = !DILocalVariable(name: "source", scope: !92, file: !12, line: 71, type: !27)
!92 = distinct !DILexicalBlock(scope: !73, file: !12, line: 70, column: 5)
!93 = !DILocation(line: 71, column: 17, scope: !92)
!94 = !DILocation(line: 73, column: 16, scope: !92)
!95 = !DILocation(line: 73, column: 22, scope: !92)
!96 = !DILocation(line: 73, column: 9, scope: !92)
!97 = !DILocation(line: 74, column: 20, scope: !92)
!98 = !DILocation(line: 74, column: 9, scope: !92)
!99 = !DILocation(line: 76, column: 1, scope: !73)
!100 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !12, line: 81, type: !16)
!102 = !DILocation(line: 81, column: 15, scope: !100)
!103 = !DILocalVariable(name: "dataBadBuffer", scope: !100, file: !12, line: 82, type: !22)
!104 = !DILocation(line: 82, column: 13, scope: !100)
!105 = !DILocalVariable(name: "dataGoodBuffer", scope: !100, file: !12, line: 83, type: !27)
!106 = !DILocation(line: 83, column: 13, scope: !100)
!107 = !DILocation(line: 84, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !100, file: !12, line: 84, column: 8)
!109 = !DILocation(line: 84, column: 8, scope: !100)
!110 = !DILocation(line: 88, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !12, line: 85, column: 5)
!112 = !DILocation(line: 88, column: 14, scope: !111)
!113 = !DILocation(line: 89, column: 9, scope: !111)
!114 = !DILocation(line: 89, column: 17, scope: !111)
!115 = !DILocation(line: 90, column: 5, scope: !111)
!116 = !DILocalVariable(name: "source", scope: !117, file: !12, line: 92, type: !27)
!117 = distinct !DILexicalBlock(scope: !100, file: !12, line: 91, column: 5)
!118 = !DILocation(line: 92, column: 17, scope: !117)
!119 = !DILocation(line: 94, column: 16, scope: !117)
!120 = !DILocation(line: 94, column: 22, scope: !117)
!121 = !DILocation(line: 94, column: 9, scope: !117)
!122 = !DILocation(line: 95, column: 20, scope: !117)
!123 = !DILocation(line: 95, column: 9, scope: !117)
!124 = !DILocation(line: 97, column: 1, scope: !100)
