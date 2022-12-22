; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_42.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_42_bad() #0 !dbg !15 {
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
  %3 = load i32*, i32** %data, align 8, !dbg !27
  %call = call i32* @badSource(i32* %3), !dbg !28
  store i32* %call, i32** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !30, metadata !DIExpression()), !dbg !35
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !40, metadata !DIExpression()), !dbg !41
  %5 = load i32*, i32** %data, align 8, !dbg !42
  %call1 = call i64 @wcslen(i32* %5) #6, !dbg !43
  store i64 %call1, i64* %dataLen, align 8, !dbg !44
  store i64 0, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !48
  %7 = load i64, i64* %dataLen, align 8, !dbg !50
  %cmp = icmp ult i64 %6, %7, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !53
  %9 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !53
  %10 = load i32, i32* %arrayidx, align 4, !dbg !53
  %11 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !57
  store i32 %10, i32* %arrayidx2, align 4, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %12, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !65
  store i32 0, i32* %arrayidx3, align 4, !dbg !66
  %13 = load i32*, i32** %data, align 8, !dbg !67
  call void @printWLine(i32* %13), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !70 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %0 = load i32*, i32** %data.addr, align 8, !dbg !75
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #7, !dbg !76
  %1 = load i32*, i32** %data.addr, align 8, !dbg !77
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !77
  store i32 0, i32* %arrayidx, align 4, !dbg !78
  %2 = load i32*, i32** %data.addr, align 8, !dbg !79
  ret i32* %2, !dbg !80
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_42_good() #0 !dbg !81 {
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
  %call = call i64 @time(i64* null) #7, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #7, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_42_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_42_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #5

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
  %3 = load i32*, i32** %data, align 8, !dbg !113
  %call = call i32* @goodG2BSource(i32* %3), !dbg !114
  store i32* %call, i32** %data, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !116, metadata !DIExpression()), !dbg !118
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !118
  call void @llvm.dbg.declare(metadata i64* %i, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !121, metadata !DIExpression()), !dbg !122
  %5 = load i32*, i32** %data, align 8, !dbg !123
  %call1 = call i64 @wcslen(i32* %5) #6, !dbg !124
  store i64 %call1, i64* %dataLen, align 8, !dbg !125
  store i64 0, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !129
  %7 = load i64, i64* %dataLen, align 8, !dbg !131
  %cmp = icmp ult i64 %6, %7, !dbg !132
  br i1 %cmp, label %for.body, label %for.end, !dbg !133

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !134
  %9 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !134
  %10 = load i32, i32* %arrayidx, align 4, !dbg !134
  %11 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !138
  store i32 %10, i32* %arrayidx2, align 4, !dbg !139
  br label %for.inc, !dbg !140

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !141
  %inc = add i64 %12, 1, !dbg !141
  store i64 %inc, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !142, !llvm.loop !143

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !145
  store i32 0, i32* %arrayidx3, align 4, !dbg !146
  %13 = load i32*, i32** %data, align 8, !dbg !147
  call void @printWLine(i32* %13), !dbg !148
  ret void, !dbg !149
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !150 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !151, metadata !DIExpression()), !dbg !152
  %0 = load i32*, i32** %data.addr, align 8, !dbg !153
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #7, !dbg !154
  %1 = load i32*, i32** %data.addr, align 8, !dbg !155
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !155
  store i32 0, i32* %arrayidx, align 4, !dbg !156
  %2 = load i32*, i32** %data.addr, align 8, !dbg !157
  ret i32* %2, !dbg !158
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_42.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_42_bad", scope: !16, file: !16, line: 31, type: !17, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_42.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 33, type: !4)
!20 = !DILocation(line: 33, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 34, type: !4)
!22 = !DILocation(line: 34, column: 15, scope: !15)
!23 = !DILocation(line: 34, column: 39, scope: !15)
!24 = !DILocation(line: 34, column: 28, scope: !15)
!25 = !DILocation(line: 35, column: 12, scope: !15)
!26 = !DILocation(line: 35, column: 10, scope: !15)
!27 = !DILocation(line: 36, column: 22, scope: !15)
!28 = !DILocation(line: 36, column: 12, scope: !15)
!29 = !DILocation(line: 36, column: 10, scope: !15)
!30 = !DILocalVariable(name: "dest", scope: !31, file: !16, line: 38, type: !32)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 37, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 50)
!35 = !DILocation(line: 38, column: 17, scope: !31)
!36 = !DILocalVariable(name: "i", scope: !31, file: !16, line: 39, type: !37)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !38)
!38 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 39, column: 16, scope: !31)
!40 = !DILocalVariable(name: "dataLen", scope: !31, file: !16, line: 39, type: !37)
!41 = !DILocation(line: 39, column: 19, scope: !31)
!42 = !DILocation(line: 40, column: 26, scope: !31)
!43 = !DILocation(line: 40, column: 19, scope: !31)
!44 = !DILocation(line: 40, column: 17, scope: !31)
!45 = !DILocation(line: 42, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !31, file: !16, line: 42, column: 9)
!47 = !DILocation(line: 42, column: 14, scope: !46)
!48 = !DILocation(line: 42, column: 21, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !16, line: 42, column: 9)
!50 = !DILocation(line: 42, column: 25, scope: !49)
!51 = !DILocation(line: 42, column: 23, scope: !49)
!52 = !DILocation(line: 42, column: 9, scope: !46)
!53 = !DILocation(line: 44, column: 23, scope: !54)
!54 = distinct !DILexicalBlock(scope: !49, file: !16, line: 43, column: 9)
!55 = !DILocation(line: 44, column: 28, scope: !54)
!56 = !DILocation(line: 44, column: 18, scope: !54)
!57 = !DILocation(line: 44, column: 13, scope: !54)
!58 = !DILocation(line: 44, column: 21, scope: !54)
!59 = !DILocation(line: 45, column: 9, scope: !54)
!60 = !DILocation(line: 42, column: 35, scope: !49)
!61 = !DILocation(line: 42, column: 9, scope: !49)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 45, column: 9, scope: !46)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 46, column: 9, scope: !31)
!66 = !DILocation(line: 46, column: 20, scope: !31)
!67 = !DILocation(line: 47, column: 20, scope: !31)
!68 = !DILocation(line: 47, column: 9, scope: !31)
!69 = !DILocation(line: 49, column: 1, scope: !15)
!70 = distinct !DISubprogram(name: "badSource", scope: !16, file: !16, line: 23, type: !71, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!4, !4}
!73 = !DILocalVariable(name: "data", arg: 1, scope: !70, file: !16, line: 23, type: !4)
!74 = !DILocation(line: 23, column: 38, scope: !70)
!75 = !DILocation(line: 26, column: 13, scope: !70)
!76 = !DILocation(line: 26, column: 5, scope: !70)
!77 = !DILocation(line: 27, column: 5, scope: !70)
!78 = !DILocation(line: 27, column: 17, scope: !70)
!79 = !DILocation(line: 28, column: 12, scope: !70)
!80 = !DILocation(line: 28, column: 5, scope: !70)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_42_good", scope: !16, file: !16, line: 84, type: !17, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 86, column: 5, scope: !81)
!83 = !DILocation(line: 87, column: 1, scope: !81)
!84 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 99, type: !85, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!7, !7, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !16, line: 99, type: !7)
!91 = !DILocation(line: 99, column: 14, scope: !84)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !16, line: 99, type: !87)
!93 = !DILocation(line: 99, column: 27, scope: !84)
!94 = !DILocation(line: 102, column: 22, scope: !84)
!95 = !DILocation(line: 102, column: 12, scope: !84)
!96 = !DILocation(line: 102, column: 5, scope: !84)
!97 = !DILocation(line: 104, column: 5, scope: !84)
!98 = !DILocation(line: 105, column: 5, scope: !84)
!99 = !DILocation(line: 106, column: 5, scope: !84)
!100 = !DILocation(line: 109, column: 5, scope: !84)
!101 = !DILocation(line: 110, column: 5, scope: !84)
!102 = !DILocation(line: 111, column: 5, scope: !84)
!103 = !DILocation(line: 113, column: 5, scope: !84)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 64, type: !17, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !16, line: 66, type: !4)
!106 = !DILocation(line: 66, column: 15, scope: !104)
!107 = !DILocalVariable(name: "dataBuffer", scope: !104, file: !16, line: 67, type: !4)
!108 = !DILocation(line: 67, column: 15, scope: !104)
!109 = !DILocation(line: 67, column: 39, scope: !104)
!110 = !DILocation(line: 67, column: 28, scope: !104)
!111 = !DILocation(line: 68, column: 12, scope: !104)
!112 = !DILocation(line: 68, column: 10, scope: !104)
!113 = !DILocation(line: 69, column: 26, scope: !104)
!114 = !DILocation(line: 69, column: 12, scope: !104)
!115 = !DILocation(line: 69, column: 10, scope: !104)
!116 = !DILocalVariable(name: "dest", scope: !117, file: !16, line: 71, type: !32)
!117 = distinct !DILexicalBlock(scope: !104, file: !16, line: 70, column: 5)
!118 = !DILocation(line: 71, column: 17, scope: !117)
!119 = !DILocalVariable(name: "i", scope: !117, file: !16, line: 72, type: !37)
!120 = !DILocation(line: 72, column: 16, scope: !117)
!121 = !DILocalVariable(name: "dataLen", scope: !117, file: !16, line: 72, type: !37)
!122 = !DILocation(line: 72, column: 19, scope: !117)
!123 = !DILocation(line: 73, column: 26, scope: !117)
!124 = !DILocation(line: 73, column: 19, scope: !117)
!125 = !DILocation(line: 73, column: 17, scope: !117)
!126 = !DILocation(line: 75, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !117, file: !16, line: 75, column: 9)
!128 = !DILocation(line: 75, column: 14, scope: !127)
!129 = !DILocation(line: 75, column: 21, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !16, line: 75, column: 9)
!131 = !DILocation(line: 75, column: 25, scope: !130)
!132 = !DILocation(line: 75, column: 23, scope: !130)
!133 = !DILocation(line: 75, column: 9, scope: !127)
!134 = !DILocation(line: 77, column: 23, scope: !135)
!135 = distinct !DILexicalBlock(scope: !130, file: !16, line: 76, column: 9)
!136 = !DILocation(line: 77, column: 28, scope: !135)
!137 = !DILocation(line: 77, column: 18, scope: !135)
!138 = !DILocation(line: 77, column: 13, scope: !135)
!139 = !DILocation(line: 77, column: 21, scope: !135)
!140 = !DILocation(line: 78, column: 9, scope: !135)
!141 = !DILocation(line: 75, column: 35, scope: !130)
!142 = !DILocation(line: 75, column: 9, scope: !130)
!143 = distinct !{!143, !133, !144, !64}
!144 = !DILocation(line: 78, column: 9, scope: !127)
!145 = !DILocation(line: 79, column: 9, scope: !117)
!146 = !DILocation(line: 79, column: 20, scope: !117)
!147 = !DILocation(line: 80, column: 20, scope: !117)
!148 = !DILocation(line: 80, column: 9, scope: !117)
!149 = !DILocation(line: 82, column: 1, scope: !104)
!150 = distinct !DISubprogram(name: "goodG2BSource", scope: !16, file: !16, line: 55, type: !71, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!151 = !DILocalVariable(name: "data", arg: 1, scope: !150, file: !16, line: 55, type: !4)
!152 = !DILocation(line: 55, column: 42, scope: !150)
!153 = !DILocation(line: 58, column: 13, scope: !150)
!154 = !DILocation(line: 58, column: 5, scope: !150)
!155 = !DILocation(line: 59, column: 5, scope: !150)
!156 = !DILocation(line: 59, column: 16, scope: !150)
!157 = !DILocation(line: 60, column: 12, scope: !150)
!158 = !DILocation(line: 60, column: 5, scope: !150)
