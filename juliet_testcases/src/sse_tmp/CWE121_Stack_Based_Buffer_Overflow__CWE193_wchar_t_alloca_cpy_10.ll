; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_10.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_10_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_10_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 40, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 44, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32, i32* @globalTrue, align 4, !dbg !29
  %tobool = icmp ne i32 %4, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  store i32* %5, i32** %data, align 8, !dbg !34
  %6 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !43
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_10_bad.source to i8*), i64 44, i1 false), !dbg !43
  %8 = load i32*, i32** %data, align 8, !dbg !44
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !45
  %call = call i32* @wcscpy(i32* %8, i32* %arraydecay) #5, !dbg !46
  %9 = load i32*, i32** %data, align 8, !dbg !47
  call void @printWLine(i32* %9), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_10_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_10_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_10_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = alloca i8, i64 40, align 16, !dbg !79
  %1 = bitcast i8* %0 to i32*, !dbg !80
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %2 = alloca i8, i64 44, align 16, !dbg !83
  %3 = bitcast i8* %2 to i32*, !dbg !84
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !82
  %4 = load i32, i32* @globalFalse, align 4, !dbg !85
  %tobool = icmp ne i32 %4, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end, !dbg !90

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !91
  store i32* %5, i32** %data, align 8, !dbg !93
  %6 = load i32*, i32** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !94
  store i32 0, i32* %arrayidx, align 4, !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !96, metadata !DIExpression()), !dbg !98
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !98
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !98
  %8 = load i32*, i32** %data, align 8, !dbg !99
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !100
  %call = call i32* @wcscpy(i32* %8, i32* %arraydecay) #5, !dbg !101
  %9 = load i32*, i32** %data, align 8, !dbg !102
  call void @printWLine(i32* %9), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = alloca i8, i64 40, align 16, !dbg !110
  %1 = bitcast i8* %0 to i32*, !dbg !111
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %2 = alloca i8, i64 44, align 16, !dbg !114
  %3 = bitcast i8* %2 to i32*, !dbg !115
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !113
  %4 = load i32, i32* @globalTrue, align 4, !dbg !116
  %tobool = icmp ne i32 %4, 0, !dbg !116
  br i1 %tobool, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !119
  store i32* %5, i32** %data, align 8, !dbg !121
  %6 = load i32*, i32** %data, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !122
  store i32 0, i32* %arrayidx, align 4, !dbg !123
  br label %if.end, !dbg !124

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !125, metadata !DIExpression()), !dbg !127
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !127
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !127
  %8 = load i32*, i32** %data, align 8, !dbg !128
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !129
  %call = call i32* @wcscpy(i32* %8, i32* %arraydecay) #5, !dbg !130
  %9 = load i32*, i32** %data, align 8, !dbg !131
  call void @printWLine(i32* %9), !dbg !132
  ret void, !dbg !133
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_10.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_10_bad", scope: !16, file: !16, line: 28, type: !17, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_10.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 30, type: !4)
!20 = !DILocation(line: 30, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 31, type: !4)
!22 = !DILocation(line: 31, column: 15, scope: !15)
!23 = !DILocation(line: 31, column: 42, scope: !15)
!24 = !DILocation(line: 31, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 32, type: !4)
!26 = !DILocation(line: 32, column: 15, scope: !15)
!27 = !DILocation(line: 32, column: 43, scope: !15)
!28 = !DILocation(line: 32, column: 32, scope: !15)
!29 = !DILocation(line: 33, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !15, file: !16, line: 33, column: 8)
!31 = !DILocation(line: 33, column: 8, scope: !15)
!32 = !DILocation(line: 37, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !16, line: 34, column: 5)
!34 = !DILocation(line: 37, column: 14, scope: !33)
!35 = !DILocation(line: 38, column: 9, scope: !33)
!36 = !DILocation(line: 38, column: 17, scope: !33)
!37 = !DILocation(line: 39, column: 5, scope: !33)
!38 = !DILocalVariable(name: "source", scope: !39, file: !16, line: 41, type: !40)
!39 = distinct !DILexicalBlock(scope: !15, file: !16, line: 40, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 11)
!43 = !DILocation(line: 41, column: 17, scope: !39)
!44 = !DILocation(line: 43, column: 16, scope: !39)
!45 = !DILocation(line: 43, column: 22, scope: !39)
!46 = !DILocation(line: 43, column: 9, scope: !39)
!47 = !DILocation(line: 44, column: 20, scope: !39)
!48 = !DILocation(line: 44, column: 9, scope: !39)
!49 = !DILocation(line: 46, column: 1, scope: !15)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_10_good", scope: !16, file: !16, line: 99, type: !17, scopeLine: 100, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 101, column: 5, scope: !50)
!52 = !DILocation(line: 102, column: 5, scope: !50)
!53 = !DILocation(line: 103, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 115, type: !55, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!7, !7, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !16, line: 115, type: !7)
!61 = !DILocation(line: 115, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !16, line: 115, type: !57)
!63 = !DILocation(line: 115, column: 27, scope: !54)
!64 = !DILocation(line: 118, column: 22, scope: !54)
!65 = !DILocation(line: 118, column: 12, scope: !54)
!66 = !DILocation(line: 118, column: 5, scope: !54)
!67 = !DILocation(line: 120, column: 5, scope: !54)
!68 = !DILocation(line: 121, column: 5, scope: !54)
!69 = !DILocation(line: 122, column: 5, scope: !54)
!70 = !DILocation(line: 125, column: 5, scope: !54)
!71 = !DILocation(line: 126, column: 5, scope: !54)
!72 = !DILocation(line: 127, column: 5, scope: !54)
!73 = !DILocation(line: 129, column: 5, scope: !54)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 53, type: !17, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !16, line: 55, type: !4)
!76 = !DILocation(line: 55, column: 15, scope: !74)
!77 = !DILocalVariable(name: "dataBadBuffer", scope: !74, file: !16, line: 56, type: !4)
!78 = !DILocation(line: 56, column: 15, scope: !74)
!79 = !DILocation(line: 56, column: 42, scope: !74)
!80 = !DILocation(line: 56, column: 31, scope: !74)
!81 = !DILocalVariable(name: "dataGoodBuffer", scope: !74, file: !16, line: 57, type: !4)
!82 = !DILocation(line: 57, column: 15, scope: !74)
!83 = !DILocation(line: 57, column: 43, scope: !74)
!84 = !DILocation(line: 57, column: 32, scope: !74)
!85 = !DILocation(line: 58, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !74, file: !16, line: 58, column: 8)
!87 = !DILocation(line: 58, column: 8, scope: !74)
!88 = !DILocation(line: 61, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !16, line: 59, column: 5)
!90 = !DILocation(line: 62, column: 5, scope: !89)
!91 = !DILocation(line: 67, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !16, line: 64, column: 5)
!93 = !DILocation(line: 67, column: 14, scope: !92)
!94 = !DILocation(line: 68, column: 9, scope: !92)
!95 = !DILocation(line: 68, column: 17, scope: !92)
!96 = !DILocalVariable(name: "source", scope: !97, file: !16, line: 71, type: !40)
!97 = distinct !DILexicalBlock(scope: !74, file: !16, line: 70, column: 5)
!98 = !DILocation(line: 71, column: 17, scope: !97)
!99 = !DILocation(line: 73, column: 16, scope: !97)
!100 = !DILocation(line: 73, column: 22, scope: !97)
!101 = !DILocation(line: 73, column: 9, scope: !97)
!102 = !DILocation(line: 74, column: 20, scope: !97)
!103 = !DILocation(line: 74, column: 9, scope: !97)
!104 = !DILocation(line: 76, column: 1, scope: !74)
!105 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 79, type: !17, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !16, line: 81, type: !4)
!107 = !DILocation(line: 81, column: 15, scope: !105)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !16, line: 82, type: !4)
!109 = !DILocation(line: 82, column: 15, scope: !105)
!110 = !DILocation(line: 82, column: 42, scope: !105)
!111 = !DILocation(line: 82, column: 31, scope: !105)
!112 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !16, line: 83, type: !4)
!113 = !DILocation(line: 83, column: 15, scope: !105)
!114 = !DILocation(line: 83, column: 43, scope: !105)
!115 = !DILocation(line: 83, column: 32, scope: !105)
!116 = !DILocation(line: 84, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !105, file: !16, line: 84, column: 8)
!118 = !DILocation(line: 84, column: 8, scope: !105)
!119 = !DILocation(line: 88, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !16, line: 85, column: 5)
!121 = !DILocation(line: 88, column: 14, scope: !120)
!122 = !DILocation(line: 89, column: 9, scope: !120)
!123 = !DILocation(line: 89, column: 17, scope: !120)
!124 = !DILocation(line: 90, column: 5, scope: !120)
!125 = !DILocalVariable(name: "source", scope: !126, file: !16, line: 92, type: !40)
!126 = distinct !DILexicalBlock(scope: !105, file: !16, line: 91, column: 5)
!127 = !DILocation(line: 92, column: 17, scope: !126)
!128 = !DILocation(line: 94, column: 16, scope: !126)
!129 = !DILocation(line: 94, column: 22, scope: !126)
!130 = !DILocation(line: 94, column: 9, scope: !126)
!131 = !DILocation(line: 95, column: 20, scope: !126)
!132 = !DILocation(line: 95, column: 9, scope: !126)
!133 = !DILocation(line: 97, column: 1, scope: !105)
