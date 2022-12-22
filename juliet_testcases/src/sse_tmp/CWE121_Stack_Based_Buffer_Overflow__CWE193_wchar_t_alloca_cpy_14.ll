; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_14.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_14_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_14_bad() #0 !dbg !15 {
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
  %4 = load i32, i32* @globalFive, align 4, !dbg !29
  %cmp = icmp eq i32 %4, 5, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !33
  store i32* %5, i32** %data, align 8, !dbg !35
  %6 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_14_bad.source to i8*), i64 44, i1 false), !dbg !44
  %8 = load i32*, i32** %data, align 8, !dbg !45
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !46
  %call = call i32* @wcscpy(i32* %8, i32* %arraydecay) #5, !dbg !47
  %9 = load i32*, i32** %data, align 8, !dbg !48
  call void @printWLine(i32* %9), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_14_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #5, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #5, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_14_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_14_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %0 = alloca i8, i64 40, align 16, !dbg !80
  %1 = bitcast i8* %0 to i32*, !dbg !81
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %2 = alloca i8, i64 44, align 16, !dbg !84
  %3 = bitcast i8* %2 to i32*, !dbg !85
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !83
  %4 = load i32, i32* @globalFive, align 4, !dbg !86
  %cmp = icmp ne i32 %4, 5, !dbg !88
  br i1 %cmp, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  br label %if.end, !dbg !92

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !93
  store i32* %5, i32** %data, align 8, !dbg !95
  %6 = load i32*, i32** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !96
  store i32 0, i32* %arrayidx, align 4, !dbg !97
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !100
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !100
  %8 = load i32*, i32** %data, align 8, !dbg !101
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !102
  %call = call i32* @wcscpy(i32* %8, i32* %arraydecay) #5, !dbg !103
  %9 = load i32*, i32** %data, align 8, !dbg !104
  call void @printWLine(i32* %9), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !107 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %0 = alloca i8, i64 40, align 16, !dbg !112
  %1 = bitcast i8* %0 to i32*, !dbg !113
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %2 = alloca i8, i64 44, align 16, !dbg !116
  %3 = bitcast i8* %2 to i32*, !dbg !117
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !115
  %4 = load i32, i32* @globalFive, align 4, !dbg !118
  %cmp = icmp eq i32 %4, 5, !dbg !120
  br i1 %cmp, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !122
  store i32* %5, i32** %data, align 8, !dbg !124
  %6 = load i32*, i32** %data, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !125
  store i32 0, i32* %arrayidx, align 4, !dbg !126
  br label %if.end, !dbg !127

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !128, metadata !DIExpression()), !dbg !130
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !130
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !130
  %8 = load i32*, i32** %data, align 8, !dbg !131
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !132
  %call = call i32* @wcscpy(i32* %8, i32* %arraydecay) #5, !dbg !133
  %9 = load i32*, i32** %data, align 8, !dbg !134
  call void @printWLine(i32* %9), !dbg !135
  ret void, !dbg !136
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_14.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_14_bad", scope: !16, file: !16, line: 28, type: !17, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_14.c", directory: "/root/SSE-Assessment")
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
!31 = !DILocation(line: 33, column: 18, scope: !30)
!32 = !DILocation(line: 33, column: 8, scope: !15)
!33 = !DILocation(line: 37, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !16, line: 34, column: 5)
!35 = !DILocation(line: 37, column: 14, scope: !34)
!36 = !DILocation(line: 38, column: 9, scope: !34)
!37 = !DILocation(line: 38, column: 17, scope: !34)
!38 = !DILocation(line: 39, column: 5, scope: !34)
!39 = !DILocalVariable(name: "source", scope: !40, file: !16, line: 41, type: !41)
!40 = distinct !DILexicalBlock(scope: !15, file: !16, line: 40, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 11)
!44 = !DILocation(line: 41, column: 17, scope: !40)
!45 = !DILocation(line: 43, column: 16, scope: !40)
!46 = !DILocation(line: 43, column: 22, scope: !40)
!47 = !DILocation(line: 43, column: 9, scope: !40)
!48 = !DILocation(line: 44, column: 20, scope: !40)
!49 = !DILocation(line: 44, column: 9, scope: !40)
!50 = !DILocation(line: 46, column: 1, scope: !15)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_14_good", scope: !16, file: !16, line: 99, type: !17, scopeLine: 100, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 101, column: 5, scope: !51)
!53 = !DILocation(line: 102, column: 5, scope: !51)
!54 = !DILocation(line: 103, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 115, type: !56, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!7, !7, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !16, line: 115, type: !7)
!62 = !DILocation(line: 115, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !16, line: 115, type: !58)
!64 = !DILocation(line: 115, column: 27, scope: !55)
!65 = !DILocation(line: 118, column: 22, scope: !55)
!66 = !DILocation(line: 118, column: 12, scope: !55)
!67 = !DILocation(line: 118, column: 5, scope: !55)
!68 = !DILocation(line: 120, column: 5, scope: !55)
!69 = !DILocation(line: 121, column: 5, scope: !55)
!70 = !DILocation(line: 122, column: 5, scope: !55)
!71 = !DILocation(line: 125, column: 5, scope: !55)
!72 = !DILocation(line: 126, column: 5, scope: !55)
!73 = !DILocation(line: 127, column: 5, scope: !55)
!74 = !DILocation(line: 129, column: 5, scope: !55)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 53, type: !17, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !16, line: 55, type: !4)
!77 = !DILocation(line: 55, column: 15, scope: !75)
!78 = !DILocalVariable(name: "dataBadBuffer", scope: !75, file: !16, line: 56, type: !4)
!79 = !DILocation(line: 56, column: 15, scope: !75)
!80 = !DILocation(line: 56, column: 42, scope: !75)
!81 = !DILocation(line: 56, column: 31, scope: !75)
!82 = !DILocalVariable(name: "dataGoodBuffer", scope: !75, file: !16, line: 57, type: !4)
!83 = !DILocation(line: 57, column: 15, scope: !75)
!84 = !DILocation(line: 57, column: 43, scope: !75)
!85 = !DILocation(line: 57, column: 32, scope: !75)
!86 = !DILocation(line: 58, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !75, file: !16, line: 58, column: 8)
!88 = !DILocation(line: 58, column: 18, scope: !87)
!89 = !DILocation(line: 58, column: 8, scope: !75)
!90 = !DILocation(line: 61, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !16, line: 59, column: 5)
!92 = !DILocation(line: 62, column: 5, scope: !91)
!93 = !DILocation(line: 67, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !87, file: !16, line: 64, column: 5)
!95 = !DILocation(line: 67, column: 14, scope: !94)
!96 = !DILocation(line: 68, column: 9, scope: !94)
!97 = !DILocation(line: 68, column: 17, scope: !94)
!98 = !DILocalVariable(name: "source", scope: !99, file: !16, line: 71, type: !41)
!99 = distinct !DILexicalBlock(scope: !75, file: !16, line: 70, column: 5)
!100 = !DILocation(line: 71, column: 17, scope: !99)
!101 = !DILocation(line: 73, column: 16, scope: !99)
!102 = !DILocation(line: 73, column: 22, scope: !99)
!103 = !DILocation(line: 73, column: 9, scope: !99)
!104 = !DILocation(line: 74, column: 20, scope: !99)
!105 = !DILocation(line: 74, column: 9, scope: !99)
!106 = !DILocation(line: 76, column: 1, scope: !75)
!107 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 79, type: !17, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !16, line: 81, type: !4)
!109 = !DILocation(line: 81, column: 15, scope: !107)
!110 = !DILocalVariable(name: "dataBadBuffer", scope: !107, file: !16, line: 82, type: !4)
!111 = !DILocation(line: 82, column: 15, scope: !107)
!112 = !DILocation(line: 82, column: 42, scope: !107)
!113 = !DILocation(line: 82, column: 31, scope: !107)
!114 = !DILocalVariable(name: "dataGoodBuffer", scope: !107, file: !16, line: 83, type: !4)
!115 = !DILocation(line: 83, column: 15, scope: !107)
!116 = !DILocation(line: 83, column: 43, scope: !107)
!117 = !DILocation(line: 83, column: 32, scope: !107)
!118 = !DILocation(line: 84, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !107, file: !16, line: 84, column: 8)
!120 = !DILocation(line: 84, column: 18, scope: !119)
!121 = !DILocation(line: 84, column: 8, scope: !107)
!122 = !DILocation(line: 88, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !16, line: 85, column: 5)
!124 = !DILocation(line: 88, column: 14, scope: !123)
!125 = !DILocation(line: 89, column: 9, scope: !123)
!126 = !DILocation(line: 89, column: 17, scope: !123)
!127 = !DILocation(line: 90, column: 5, scope: !123)
!128 = !DILocalVariable(name: "source", scope: !129, file: !16, line: 92, type: !41)
!129 = distinct !DILexicalBlock(scope: !107, file: !16, line: 91, column: 5)
!130 = !DILocation(line: 92, column: 17, scope: !129)
!131 = !DILocation(line: 94, column: 16, scope: !129)
!132 = !DILocation(line: 94, column: 22, scope: !129)
!133 = !DILocation(line: 94, column: 9, scope: !129)
!134 = !DILocation(line: 95, column: 20, scope: !129)
!135 = !DILocation(line: 95, column: 9, scope: !129)
!136 = !DILocation(line: 97, column: 1, scope: !107)
