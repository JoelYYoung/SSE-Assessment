; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_12_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  store i32* %2, i32** %data, align 8, !dbg !26
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.else, !dbg !29

if.then:                                          ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !30
  %call1 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !32
  %4 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  br label %if.end, !dbg !35

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %data, align 8, !dbg !36
  %call2 = call i32* @wmemset(i32* %5, i32 65, i64 49) #6, !dbg !38
  %6 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 49, !dbg !39
  store i32 0, i32* %arrayidx3, align 4, !dbg !40
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %7 = bitcast [50 x i32]* %dest to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 200, i1 false), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !51, metadata !DIExpression()), !dbg !52
  %8 = load i32*, i32** %data, align 8, !dbg !53
  %call4 = call i64 @wcslen(i32* %8) #7, !dbg !54
  store i64 %call4, i64* %dataLen, align 8, !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i64, i64* %i, align 8, !dbg !59
  %10 = load i64, i64* %dataLen, align 8, !dbg !61
  %cmp = icmp ult i64 %9, %10, !dbg !62
  br i1 %cmp, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !64
  %12 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx5 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !64
  %13 = load i32, i32* %arrayidx5, align 4, !dbg !64
  %14 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %14, !dbg !68
  store i32 %13, i32* %arrayidx6, align 4, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %15, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !76
  store i32 0, i32* %arrayidx7, align 4, !dbg !77
  %16 = load i32*, i32** %data, align 8, !dbg !78
  call void @printWLine(i32* %16), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_12_good() #0 !dbg !81 {
entry:
  call void @goodG2B(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* null) #6, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #6, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_12_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_12_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = alloca i8, i64 400, align 16, !dbg !109
  %1 = bitcast i8* %0 to i32*, !dbg !110
  store i32* %1, i32** %dataBuffer, align 8, !dbg !108
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !111
  store i32* %2, i32** %data, align 8, !dbg !112
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !113
  %tobool = icmp ne i32 %call, 0, !dbg !113
  br i1 %tobool, label %if.then, label %if.else, !dbg !115

if.then:                                          ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !116
  %call1 = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !118
  %4 = load i32*, i32** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !119
  store i32 0, i32* %arrayidx, align 4, !dbg !120
  br label %if.end, !dbg !121

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %data, align 8, !dbg !122
  %call2 = call i32* @wmemset(i32* %5, i32 65, i64 49) #6, !dbg !124
  %6 = load i32*, i32** %data, align 8, !dbg !125
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 49, !dbg !125
  store i32 0, i32* %arrayidx3, align 4, !dbg !126
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !127, metadata !DIExpression()), !dbg !129
  %7 = bitcast [50 x i32]* %dest to i8*, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 200, i1 false), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %i, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !132, metadata !DIExpression()), !dbg !133
  %8 = load i32*, i32** %data, align 8, !dbg !134
  %call4 = call i64 @wcslen(i32* %8) #7, !dbg !135
  store i64 %call4, i64* %dataLen, align 8, !dbg !136
  store i64 0, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i64, i64* %i, align 8, !dbg !140
  %10 = load i64, i64* %dataLen, align 8, !dbg !142
  %cmp = icmp ult i64 %9, %10, !dbg !143
  br i1 %cmp, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !145
  %12 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx5 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !145
  %13 = load i32, i32* %arrayidx5, align 4, !dbg !145
  %14 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %14, !dbg !149
  store i32 %13, i32* %arrayidx6, align 4, !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !152
  %inc = add i64 %15, 1, !dbg !152
  store i64 %inc, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !156
  store i32 0, i32* %arrayidx7, align 4, !dbg !157
  %16 = load i32*, i32** %data, align 8, !dbg !158
  call void @printWLine(i32* %16), !dbg !159
  ret void, !dbg !160
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_12.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_12_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_12.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 39, scope: !15)
!24 = !DILocation(line: 26, column: 28, scope: !15)
!25 = !DILocation(line: 27, column: 12, scope: !15)
!26 = !DILocation(line: 27, column: 10, scope: !15)
!27 = !DILocation(line: 28, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !15, file: !16, line: 28, column: 8)
!29 = !DILocation(line: 28, column: 8, scope: !15)
!30 = !DILocation(line: 31, column: 17, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !16, line: 29, column: 5)
!32 = !DILocation(line: 31, column: 9, scope: !31)
!33 = !DILocation(line: 32, column: 9, scope: !31)
!34 = !DILocation(line: 32, column: 21, scope: !31)
!35 = !DILocation(line: 33, column: 5, scope: !31)
!36 = !DILocation(line: 37, column: 17, scope: !37)
!37 = distinct !DILexicalBlock(scope: !28, file: !16, line: 35, column: 5)
!38 = !DILocation(line: 37, column: 9, scope: !37)
!39 = !DILocation(line: 38, column: 9, scope: !37)
!40 = !DILocation(line: 38, column: 20, scope: !37)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !16, line: 41, type: !43)
!42 = distinct !DILexicalBlock(scope: !15, file: !16, line: 40, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 50)
!46 = !DILocation(line: 41, column: 17, scope: !42)
!47 = !DILocalVariable(name: "i", scope: !42, file: !16, line: 42, type: !48)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !49)
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 42, column: 16, scope: !42)
!51 = !DILocalVariable(name: "dataLen", scope: !42, file: !16, line: 42, type: !48)
!52 = !DILocation(line: 42, column: 19, scope: !42)
!53 = !DILocation(line: 43, column: 26, scope: !42)
!54 = !DILocation(line: 43, column: 19, scope: !42)
!55 = !DILocation(line: 43, column: 17, scope: !42)
!56 = !DILocation(line: 45, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !42, file: !16, line: 45, column: 9)
!58 = !DILocation(line: 45, column: 14, scope: !57)
!59 = !DILocation(line: 45, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !16, line: 45, column: 9)
!61 = !DILocation(line: 45, column: 25, scope: !60)
!62 = !DILocation(line: 45, column: 23, scope: !60)
!63 = !DILocation(line: 45, column: 9, scope: !57)
!64 = !DILocation(line: 47, column: 23, scope: !65)
!65 = distinct !DILexicalBlock(scope: !60, file: !16, line: 46, column: 9)
!66 = !DILocation(line: 47, column: 28, scope: !65)
!67 = !DILocation(line: 47, column: 18, scope: !65)
!68 = !DILocation(line: 47, column: 13, scope: !65)
!69 = !DILocation(line: 47, column: 21, scope: !65)
!70 = !DILocation(line: 48, column: 9, scope: !65)
!71 = !DILocation(line: 45, column: 35, scope: !60)
!72 = !DILocation(line: 45, column: 9, scope: !60)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 48, column: 9, scope: !57)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 49, column: 9, scope: !42)
!77 = !DILocation(line: 49, column: 20, scope: !42)
!78 = !DILocation(line: 50, column: 20, scope: !42)
!79 = !DILocation(line: 50, column: 9, scope: !42)
!80 = !DILocation(line: 52, column: 1, scope: !15)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_12_good", scope: !16, file: !16, line: 91, type: !17, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 93, column: 5, scope: !81)
!83 = !DILocation(line: 94, column: 1, scope: !81)
!84 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 106, type: !85, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!7, !7, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !16, line: 106, type: !7)
!91 = !DILocation(line: 106, column: 14, scope: !84)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !16, line: 106, type: !87)
!93 = !DILocation(line: 106, column: 27, scope: !84)
!94 = !DILocation(line: 109, column: 22, scope: !84)
!95 = !DILocation(line: 109, column: 12, scope: !84)
!96 = !DILocation(line: 109, column: 5, scope: !84)
!97 = !DILocation(line: 111, column: 5, scope: !84)
!98 = !DILocation(line: 112, column: 5, scope: !84)
!99 = !DILocation(line: 113, column: 5, scope: !84)
!100 = !DILocation(line: 116, column: 5, scope: !84)
!101 = !DILocation(line: 117, column: 5, scope: !84)
!102 = !DILocation(line: 118, column: 5, scope: !84)
!103 = !DILocation(line: 120, column: 5, scope: !84)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 60, type: !17, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !16, line: 62, type: !4)
!106 = !DILocation(line: 62, column: 15, scope: !104)
!107 = !DILocalVariable(name: "dataBuffer", scope: !104, file: !16, line: 63, type: !4)
!108 = !DILocation(line: 63, column: 15, scope: !104)
!109 = !DILocation(line: 63, column: 39, scope: !104)
!110 = !DILocation(line: 63, column: 28, scope: !104)
!111 = !DILocation(line: 64, column: 12, scope: !104)
!112 = !DILocation(line: 64, column: 10, scope: !104)
!113 = !DILocation(line: 65, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !104, file: !16, line: 65, column: 8)
!115 = !DILocation(line: 65, column: 8, scope: !104)
!116 = !DILocation(line: 68, column: 17, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !16, line: 66, column: 5)
!118 = !DILocation(line: 68, column: 9, scope: !117)
!119 = !DILocation(line: 69, column: 9, scope: !117)
!120 = !DILocation(line: 69, column: 20, scope: !117)
!121 = !DILocation(line: 70, column: 5, scope: !117)
!122 = !DILocation(line: 74, column: 17, scope: !123)
!123 = distinct !DILexicalBlock(scope: !114, file: !16, line: 72, column: 5)
!124 = !DILocation(line: 74, column: 9, scope: !123)
!125 = !DILocation(line: 75, column: 9, scope: !123)
!126 = !DILocation(line: 75, column: 20, scope: !123)
!127 = !DILocalVariable(name: "dest", scope: !128, file: !16, line: 78, type: !43)
!128 = distinct !DILexicalBlock(scope: !104, file: !16, line: 77, column: 5)
!129 = !DILocation(line: 78, column: 17, scope: !128)
!130 = !DILocalVariable(name: "i", scope: !128, file: !16, line: 79, type: !48)
!131 = !DILocation(line: 79, column: 16, scope: !128)
!132 = !DILocalVariable(name: "dataLen", scope: !128, file: !16, line: 79, type: !48)
!133 = !DILocation(line: 79, column: 19, scope: !128)
!134 = !DILocation(line: 80, column: 26, scope: !128)
!135 = !DILocation(line: 80, column: 19, scope: !128)
!136 = !DILocation(line: 80, column: 17, scope: !128)
!137 = !DILocation(line: 82, column: 16, scope: !138)
!138 = distinct !DILexicalBlock(scope: !128, file: !16, line: 82, column: 9)
!139 = !DILocation(line: 82, column: 14, scope: !138)
!140 = !DILocation(line: 82, column: 21, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !16, line: 82, column: 9)
!142 = !DILocation(line: 82, column: 25, scope: !141)
!143 = !DILocation(line: 82, column: 23, scope: !141)
!144 = !DILocation(line: 82, column: 9, scope: !138)
!145 = !DILocation(line: 84, column: 23, scope: !146)
!146 = distinct !DILexicalBlock(scope: !141, file: !16, line: 83, column: 9)
!147 = !DILocation(line: 84, column: 28, scope: !146)
!148 = !DILocation(line: 84, column: 18, scope: !146)
!149 = !DILocation(line: 84, column: 13, scope: !146)
!150 = !DILocation(line: 84, column: 21, scope: !146)
!151 = !DILocation(line: 85, column: 9, scope: !146)
!152 = !DILocation(line: 82, column: 35, scope: !141)
!153 = !DILocation(line: 82, column: 9, scope: !141)
!154 = distinct !{!154, !144, !155, !75}
!155 = !DILocation(line: 85, column: 9, scope: !138)
!156 = !DILocation(line: 86, column: 9, scope: !128)
!157 = !DILocation(line: 86, column: 20, scope: !128)
!158 = !DILocation(line: 87, column: 20, scope: !128)
!159 = !DILocation(line: 87, column: 9, scope: !128)
!160 = !DILocation(line: 89, column: 1, scope: !104)
