; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_07_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 40, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 44, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  %4 = load i32, i32* @staticFive, align 4, !dbg !32
  %cmp = icmp eq i32 %4, 5, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !36
  store i32* %5, i32** %data, align 8, !dbg !38
  %6 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !42, metadata !DIExpression()), !dbg !47
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !47
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_07_bad.source to i8*), i64 44, i1 false), !dbg !47
  %8 = load i32*, i32** %data, align 8, !dbg !48
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !49
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !50
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !51
  %add = add i64 %call, 1, !dbg !52
  %call2 = call i32* @wcsncpy(i32* %8, i32* %arraydecay, i64 %add) #7, !dbg !53
  %9 = load i32*, i32** %data, align 8, !dbg !54
  call void @printWLine(i32* %9), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_07_good() #0 !dbg !57 {
entry:
  call void @goodG2B1(), !dbg !58
  call void @goodG2B2(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #7, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #7, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_07_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_07_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %0 = alloca i8, i64 40, align 16, !dbg !86
  %1 = bitcast i8* %0 to i32*, !dbg !87
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %2 = alloca i8, i64 44, align 16, !dbg !90
  %3 = bitcast i8* %2 to i32*, !dbg !91
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !89
  %4 = load i32, i32* @staticFive, align 4, !dbg !92
  %cmp = icmp ne i32 %4, 5, !dbg !94
  br i1 %cmp, label %if.then, label %if.else, !dbg !95

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !96
  br label %if.end, !dbg !98

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !99
  store i32* %5, i32** %data, align 8, !dbg !101
  %6 = load i32*, i32** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !106
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !106
  %8 = load i32*, i32** %data, align 8, !dbg !107
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !108
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !109
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !110
  %add = add i64 %call, 1, !dbg !111
  %call2 = call i32* @wcsncpy(i32* %8, i32* %arraydecay, i64 %add) #7, !dbg !112
  %9 = load i32*, i32** %data, align 8, !dbg !113
  call void @printWLine(i32* %9), !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !116 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  %0 = alloca i8, i64 40, align 16, !dbg !121
  %1 = bitcast i8* %0 to i32*, !dbg !122
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !123, metadata !DIExpression()), !dbg !124
  %2 = alloca i8, i64 44, align 16, !dbg !125
  %3 = bitcast i8* %2 to i32*, !dbg !126
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !124
  %4 = load i32, i32* @staticFive, align 4, !dbg !127
  %cmp = icmp eq i32 %4, 5, !dbg !129
  br i1 %cmp, label %if.then, label %if.end, !dbg !130

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !131
  store i32* %5, i32** %data, align 8, !dbg !133
  %6 = load i32*, i32** %data, align 8, !dbg !134
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !134
  store i32 0, i32* %arrayidx, align 4, !dbg !135
  br label %if.end, !dbg !136

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !137, metadata !DIExpression()), !dbg !139
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !139
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !139
  %8 = load i32*, i32** %data, align 8, !dbg !140
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !141
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !142
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !143
  %add = add i64 %call, 1, !dbg !144
  %call2 = call i32* @wcsncpy(i32* %8, i32* %arraydecay, i64 %add) #7, !dbg !145
  %9 = load i32*, i32** %data, align 8, !dbg !146
  call void @printWLine(i32* %9), !dbg !147
  ret void, !dbg !148
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !12, line: 30, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0}
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_07.c", directory: "/root/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_07_bad", scope: !12, file: !12, line: 34, type: !20, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 36, type: !6)
!23 = !DILocation(line: 36, column: 15, scope: !19)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !12, line: 37, type: !6)
!25 = !DILocation(line: 37, column: 15, scope: !19)
!26 = !DILocation(line: 37, column: 42, scope: !19)
!27 = !DILocation(line: 37, column: 31, scope: !19)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !12, line: 38, type: !6)
!29 = !DILocation(line: 38, column: 15, scope: !19)
!30 = !DILocation(line: 38, column: 43, scope: !19)
!31 = !DILocation(line: 38, column: 32, scope: !19)
!32 = !DILocation(line: 39, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !19, file: !12, line: 39, column: 8)
!34 = !DILocation(line: 39, column: 18, scope: !33)
!35 = !DILocation(line: 39, column: 8, scope: !19)
!36 = !DILocation(line: 43, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !12, line: 40, column: 5)
!38 = !DILocation(line: 43, column: 14, scope: !37)
!39 = !DILocation(line: 44, column: 9, scope: !37)
!40 = !DILocation(line: 44, column: 17, scope: !37)
!41 = !DILocation(line: 45, column: 5, scope: !37)
!42 = !DILocalVariable(name: "source", scope: !43, file: !12, line: 47, type: !44)
!43 = distinct !DILexicalBlock(scope: !19, file: !12, line: 46, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 352, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 11)
!47 = !DILocation(line: 47, column: 17, scope: !43)
!48 = !DILocation(line: 50, column: 17, scope: !43)
!49 = !DILocation(line: 50, column: 23, scope: !43)
!50 = !DILocation(line: 50, column: 38, scope: !43)
!51 = !DILocation(line: 50, column: 31, scope: !43)
!52 = !DILocation(line: 50, column: 46, scope: !43)
!53 = !DILocation(line: 50, column: 9, scope: !43)
!54 = !DILocation(line: 51, column: 20, scope: !43)
!55 = !DILocation(line: 51, column: 9, scope: !43)
!56 = !DILocation(line: 53, column: 1, scope: !19)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_07_good", scope: !12, file: !12, line: 108, type: !20, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DILocation(line: 110, column: 5, scope: !57)
!59 = !DILocation(line: 111, column: 5, scope: !57)
!60 = !DILocation(line: 112, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 124, type: !62, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DISubroutineType(types: !63)
!63 = !{!9, !9, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !12, line: 124, type: !9)
!68 = !DILocation(line: 124, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !12, line: 124, type: !64)
!70 = !DILocation(line: 124, column: 27, scope: !61)
!71 = !DILocation(line: 127, column: 22, scope: !61)
!72 = !DILocation(line: 127, column: 12, scope: !61)
!73 = !DILocation(line: 127, column: 5, scope: !61)
!74 = !DILocation(line: 129, column: 5, scope: !61)
!75 = !DILocation(line: 130, column: 5, scope: !61)
!76 = !DILocation(line: 131, column: 5, scope: !61)
!77 = !DILocation(line: 134, column: 5, scope: !61)
!78 = !DILocation(line: 135, column: 5, scope: !61)
!79 = !DILocation(line: 136, column: 5, scope: !61)
!80 = !DILocation(line: 138, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 60, type: !20, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocalVariable(name: "data", scope: !81, file: !12, line: 62, type: !6)
!83 = !DILocation(line: 62, column: 15, scope: !81)
!84 = !DILocalVariable(name: "dataBadBuffer", scope: !81, file: !12, line: 63, type: !6)
!85 = !DILocation(line: 63, column: 15, scope: !81)
!86 = !DILocation(line: 63, column: 42, scope: !81)
!87 = !DILocation(line: 63, column: 31, scope: !81)
!88 = !DILocalVariable(name: "dataGoodBuffer", scope: !81, file: !12, line: 64, type: !6)
!89 = !DILocation(line: 64, column: 15, scope: !81)
!90 = !DILocation(line: 64, column: 43, scope: !81)
!91 = !DILocation(line: 64, column: 32, scope: !81)
!92 = !DILocation(line: 65, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !81, file: !12, line: 65, column: 8)
!94 = !DILocation(line: 65, column: 18, scope: !93)
!95 = !DILocation(line: 65, column: 8, scope: !81)
!96 = !DILocation(line: 68, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !12, line: 66, column: 5)
!98 = !DILocation(line: 69, column: 5, scope: !97)
!99 = !DILocation(line: 74, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !93, file: !12, line: 71, column: 5)
!101 = !DILocation(line: 74, column: 14, scope: !100)
!102 = !DILocation(line: 75, column: 9, scope: !100)
!103 = !DILocation(line: 75, column: 17, scope: !100)
!104 = !DILocalVariable(name: "source", scope: !105, file: !12, line: 78, type: !44)
!105 = distinct !DILexicalBlock(scope: !81, file: !12, line: 77, column: 5)
!106 = !DILocation(line: 78, column: 17, scope: !105)
!107 = !DILocation(line: 81, column: 17, scope: !105)
!108 = !DILocation(line: 81, column: 23, scope: !105)
!109 = !DILocation(line: 81, column: 38, scope: !105)
!110 = !DILocation(line: 81, column: 31, scope: !105)
!111 = !DILocation(line: 81, column: 46, scope: !105)
!112 = !DILocation(line: 81, column: 9, scope: !105)
!113 = !DILocation(line: 82, column: 20, scope: !105)
!114 = !DILocation(line: 82, column: 9, scope: !105)
!115 = !DILocation(line: 84, column: 1, scope: !81)
!116 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 87, type: !20, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!117 = !DILocalVariable(name: "data", scope: !116, file: !12, line: 89, type: !6)
!118 = !DILocation(line: 89, column: 15, scope: !116)
!119 = !DILocalVariable(name: "dataBadBuffer", scope: !116, file: !12, line: 90, type: !6)
!120 = !DILocation(line: 90, column: 15, scope: !116)
!121 = !DILocation(line: 90, column: 42, scope: !116)
!122 = !DILocation(line: 90, column: 31, scope: !116)
!123 = !DILocalVariable(name: "dataGoodBuffer", scope: !116, file: !12, line: 91, type: !6)
!124 = !DILocation(line: 91, column: 15, scope: !116)
!125 = !DILocation(line: 91, column: 43, scope: !116)
!126 = !DILocation(line: 91, column: 32, scope: !116)
!127 = !DILocation(line: 92, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !116, file: !12, line: 92, column: 8)
!129 = !DILocation(line: 92, column: 18, scope: !128)
!130 = !DILocation(line: 92, column: 8, scope: !116)
!131 = !DILocation(line: 96, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !12, line: 93, column: 5)
!133 = !DILocation(line: 96, column: 14, scope: !132)
!134 = !DILocation(line: 97, column: 9, scope: !132)
!135 = !DILocation(line: 97, column: 17, scope: !132)
!136 = !DILocation(line: 98, column: 5, scope: !132)
!137 = !DILocalVariable(name: "source", scope: !138, file: !12, line: 100, type: !44)
!138 = distinct !DILexicalBlock(scope: !116, file: !12, line: 99, column: 5)
!139 = !DILocation(line: 100, column: 17, scope: !138)
!140 = !DILocation(line: 103, column: 17, scope: !138)
!141 = !DILocation(line: 103, column: 23, scope: !138)
!142 = !DILocation(line: 103, column: 38, scope: !138)
!143 = !DILocation(line: 103, column: 31, scope: !138)
!144 = !DILocation(line: 103, column: 46, scope: !138)
!145 = !DILocation(line: 103, column: 9, scope: !138)
!146 = !DILocation(line: 104, column: 20, scope: !138)
!147 = !DILocation(line: 104, column: 9, scope: !138)
!148 = !DILocation(line: 106, column: 1, scope: !116)
