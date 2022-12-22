; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 200, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 400, align 16, !dbg !30
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
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !42, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !48
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !49
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !50
  store i32 0, i32* %arrayidx1, align 4, !dbg !51
  %7 = load i32*, i32** %data, align 8, !dbg !52
  %8 = bitcast i32* %7 to i8*, !dbg !53
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !53
  %9 = bitcast i32* %arraydecay2 to i8*, !dbg !53
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 400, i1 false), !dbg !53
  %10 = load i32*, i32** %data, align 8, !dbg !54
  %arrayidx3 = getelementptr inbounds i32, i32* %10, i64 99, !dbg !54
  store i32 0, i32* %arrayidx3, align 4, !dbg !55
  %11 = load i32*, i32** %data, align 8, !dbg !56
  call void @printWLine(i32* %11), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_07_good() #0 !dbg !59 {
entry:
  call void @goodG2B1(), !dbg !60
  call void @goodG2B2(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #5, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #5, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_07_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_07_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %0 = alloca i8, i64 200, align 16, !dbg !88
  %1 = bitcast i8* %0 to i32*, !dbg !89
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %2 = alloca i8, i64 400, align 16, !dbg !92
  %3 = bitcast i8* %2 to i32*, !dbg !93
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !91
  %4 = load i32, i32* @staticFive, align 4, !dbg !94
  %cmp = icmp ne i32 %4, 5, !dbg !96
  br i1 %cmp, label %if.then, label %if.else, !dbg !97

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !98
  br label %if.end, !dbg !100

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !101
  store i32* %5, i32** %data, align 8, !dbg !103
  %6 = load i32*, i32** %data, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !104
  store i32 0, i32* %arrayidx, align 4, !dbg !105
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !106, metadata !DIExpression()), !dbg !108
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !109
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !110
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !111
  store i32 0, i32* %arrayidx1, align 4, !dbg !112
  %7 = load i32*, i32** %data, align 8, !dbg !113
  %8 = bitcast i32* %7 to i8*, !dbg !114
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !114
  %9 = bitcast i32* %arraydecay2 to i8*, !dbg !114
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 400, i1 false), !dbg !114
  %10 = load i32*, i32** %data, align 8, !dbg !115
  %arrayidx3 = getelementptr inbounds i32, i32* %10, i64 99, !dbg !115
  store i32 0, i32* %arrayidx3, align 4, !dbg !116
  %11 = load i32*, i32** %data, align 8, !dbg !117
  call void @printWLine(i32* %11), !dbg !118
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !120 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !123, metadata !DIExpression()), !dbg !124
  %0 = alloca i8, i64 200, align 16, !dbg !125
  %1 = bitcast i8* %0 to i32*, !dbg !126
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !127, metadata !DIExpression()), !dbg !128
  %2 = alloca i8, i64 400, align 16, !dbg !129
  %3 = bitcast i8* %2 to i32*, !dbg !130
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !128
  %4 = load i32, i32* @staticFive, align 4, !dbg !131
  %cmp = icmp eq i32 %4, 5, !dbg !133
  br i1 %cmp, label %if.then, label %if.end, !dbg !134

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !135
  store i32* %5, i32** %data, align 8, !dbg !137
  %6 = load i32*, i32** %data, align 8, !dbg !138
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !138
  store i32 0, i32* %arrayidx, align 4, !dbg !139
  br label %if.end, !dbg !140

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !141, metadata !DIExpression()), !dbg !143
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !144
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !145
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !146
  store i32 0, i32* %arrayidx1, align 4, !dbg !147
  %7 = load i32*, i32** %data, align 8, !dbg !148
  %8 = bitcast i32* %7 to i8*, !dbg !149
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !149
  %9 = bitcast i32* %arraydecay2 to i8*, !dbg !149
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 400, i1 false), !dbg !149
  %10 = load i32*, i32** %data, align 8, !dbg !150
  %arrayidx3 = getelementptr inbounds i32, i32* %10, i64 99, !dbg !150
  store i32 0, i32* %arrayidx3, align 4, !dbg !151
  %11 = load i32*, i32** %data, align 8, !dbg !152
  call void @printWLine(i32* %11), !dbg !153
  ret void, !dbg !154
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !12, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0}
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_07.c", directory: "/root/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_07_bad", scope: !12, file: !12, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 31, type: !6)
!23 = !DILocation(line: 31, column: 15, scope: !19)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !12, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 15, scope: !19)
!26 = !DILocation(line: 32, column: 42, scope: !19)
!27 = !DILocation(line: 32, column: 31, scope: !19)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !12, line: 33, type: !6)
!29 = !DILocation(line: 33, column: 15, scope: !19)
!30 = !DILocation(line: 33, column: 43, scope: !19)
!31 = !DILocation(line: 33, column: 32, scope: !19)
!32 = !DILocation(line: 34, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !19, file: !12, line: 34, column: 8)
!34 = !DILocation(line: 34, column: 18, scope: !33)
!35 = !DILocation(line: 34, column: 8, scope: !19)
!36 = !DILocation(line: 38, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !12, line: 35, column: 5)
!38 = !DILocation(line: 38, column: 14, scope: !37)
!39 = !DILocation(line: 39, column: 9, scope: !37)
!40 = !DILocation(line: 39, column: 17, scope: !37)
!41 = !DILocation(line: 40, column: 5, scope: !37)
!42 = !DILocalVariable(name: "source", scope: !43, file: !12, line: 42, type: !44)
!43 = distinct !DILexicalBlock(scope: !19, file: !12, line: 41, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 42, column: 17, scope: !43)
!48 = !DILocation(line: 43, column: 17, scope: !43)
!49 = !DILocation(line: 43, column: 9, scope: !43)
!50 = !DILocation(line: 44, column: 9, scope: !43)
!51 = !DILocation(line: 44, column: 23, scope: !43)
!52 = !DILocation(line: 46, column: 16, scope: !43)
!53 = !DILocation(line: 46, column: 9, scope: !43)
!54 = !DILocation(line: 47, column: 9, scope: !43)
!55 = !DILocation(line: 47, column: 21, scope: !43)
!56 = !DILocation(line: 48, column: 20, scope: !43)
!57 = !DILocation(line: 48, column: 9, scope: !43)
!58 = !DILocation(line: 50, column: 1, scope: !19)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_07_good", scope: !12, file: !12, line: 107, type: !20, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DILocation(line: 109, column: 5, scope: !59)
!61 = !DILocation(line: 110, column: 5, scope: !59)
!62 = !DILocation(line: 111, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 123, type: !64, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DISubroutineType(types: !65)
!65 = !{!9, !9, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !12, line: 123, type: !9)
!70 = !DILocation(line: 123, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !12, line: 123, type: !66)
!72 = !DILocation(line: 123, column: 27, scope: !63)
!73 = !DILocation(line: 126, column: 22, scope: !63)
!74 = !DILocation(line: 126, column: 12, scope: !63)
!75 = !DILocation(line: 126, column: 5, scope: !63)
!76 = !DILocation(line: 128, column: 5, scope: !63)
!77 = !DILocation(line: 129, column: 5, scope: !63)
!78 = !DILocation(line: 130, column: 5, scope: !63)
!79 = !DILocation(line: 133, column: 5, scope: !63)
!80 = !DILocation(line: 134, column: 5, scope: !63)
!81 = !DILocation(line: 135, column: 5, scope: !63)
!82 = !DILocation(line: 137, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 57, type: !20, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DILocalVariable(name: "data", scope: !83, file: !12, line: 59, type: !6)
!85 = !DILocation(line: 59, column: 15, scope: !83)
!86 = !DILocalVariable(name: "dataBadBuffer", scope: !83, file: !12, line: 60, type: !6)
!87 = !DILocation(line: 60, column: 15, scope: !83)
!88 = !DILocation(line: 60, column: 42, scope: !83)
!89 = !DILocation(line: 60, column: 31, scope: !83)
!90 = !DILocalVariable(name: "dataGoodBuffer", scope: !83, file: !12, line: 61, type: !6)
!91 = !DILocation(line: 61, column: 15, scope: !83)
!92 = !DILocation(line: 61, column: 43, scope: !83)
!93 = !DILocation(line: 61, column: 32, scope: !83)
!94 = !DILocation(line: 62, column: 8, scope: !95)
!95 = distinct !DILexicalBlock(scope: !83, file: !12, line: 62, column: 8)
!96 = !DILocation(line: 62, column: 18, scope: !95)
!97 = !DILocation(line: 62, column: 8, scope: !83)
!98 = !DILocation(line: 65, column: 9, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !12, line: 63, column: 5)
!100 = !DILocation(line: 66, column: 5, scope: !99)
!101 = !DILocation(line: 70, column: 16, scope: !102)
!102 = distinct !DILexicalBlock(scope: !95, file: !12, line: 68, column: 5)
!103 = !DILocation(line: 70, column: 14, scope: !102)
!104 = !DILocation(line: 71, column: 9, scope: !102)
!105 = !DILocation(line: 71, column: 17, scope: !102)
!106 = !DILocalVariable(name: "source", scope: !107, file: !12, line: 74, type: !44)
!107 = distinct !DILexicalBlock(scope: !83, file: !12, line: 73, column: 5)
!108 = !DILocation(line: 74, column: 17, scope: !107)
!109 = !DILocation(line: 75, column: 17, scope: !107)
!110 = !DILocation(line: 75, column: 9, scope: !107)
!111 = !DILocation(line: 76, column: 9, scope: !107)
!112 = !DILocation(line: 76, column: 23, scope: !107)
!113 = !DILocation(line: 78, column: 16, scope: !107)
!114 = !DILocation(line: 78, column: 9, scope: !107)
!115 = !DILocation(line: 79, column: 9, scope: !107)
!116 = !DILocation(line: 79, column: 21, scope: !107)
!117 = !DILocation(line: 80, column: 20, scope: !107)
!118 = !DILocation(line: 80, column: 9, scope: !107)
!119 = !DILocation(line: 82, column: 1, scope: !83)
!120 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 85, type: !20, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!121 = !DILocalVariable(name: "data", scope: !120, file: !12, line: 87, type: !6)
!122 = !DILocation(line: 87, column: 15, scope: !120)
!123 = !DILocalVariable(name: "dataBadBuffer", scope: !120, file: !12, line: 88, type: !6)
!124 = !DILocation(line: 88, column: 15, scope: !120)
!125 = !DILocation(line: 88, column: 42, scope: !120)
!126 = !DILocation(line: 88, column: 31, scope: !120)
!127 = !DILocalVariable(name: "dataGoodBuffer", scope: !120, file: !12, line: 89, type: !6)
!128 = !DILocation(line: 89, column: 15, scope: !120)
!129 = !DILocation(line: 89, column: 43, scope: !120)
!130 = !DILocation(line: 89, column: 32, scope: !120)
!131 = !DILocation(line: 90, column: 8, scope: !132)
!132 = distinct !DILexicalBlock(scope: !120, file: !12, line: 90, column: 8)
!133 = !DILocation(line: 90, column: 18, scope: !132)
!134 = !DILocation(line: 90, column: 8, scope: !120)
!135 = !DILocation(line: 93, column: 16, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !12, line: 91, column: 5)
!137 = !DILocation(line: 93, column: 14, scope: !136)
!138 = !DILocation(line: 94, column: 9, scope: !136)
!139 = !DILocation(line: 94, column: 17, scope: !136)
!140 = !DILocation(line: 95, column: 5, scope: !136)
!141 = !DILocalVariable(name: "source", scope: !142, file: !12, line: 97, type: !44)
!142 = distinct !DILexicalBlock(scope: !120, file: !12, line: 96, column: 5)
!143 = !DILocation(line: 97, column: 17, scope: !142)
!144 = !DILocation(line: 98, column: 17, scope: !142)
!145 = !DILocation(line: 98, column: 9, scope: !142)
!146 = !DILocation(line: 99, column: 9, scope: !142)
!147 = !DILocation(line: 99, column: 23, scope: !142)
!148 = !DILocation(line: 101, column: 16, scope: !142)
!149 = !DILocation(line: 101, column: 9, scope: !142)
!150 = !DILocation(line: 102, column: 9, scope: !142)
!151 = !DILocation(line: 102, column: 21, scope: !142)
!152 = !DILocation(line: 103, column: 20, scope: !142)
!153 = !DILocation(line: 103, column: 9, scope: !142)
!154 = !DILocation(line: 105, column: 1, scope: !120)
