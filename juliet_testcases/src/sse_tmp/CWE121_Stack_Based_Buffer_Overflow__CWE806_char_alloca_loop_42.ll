; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_42.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_42_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  store i8* %1, i8** %data, align 8, !dbg !23
  %2 = load i8*, i8** %data, align 8, !dbg !24
  %call = call i8* @badSource(i8* %2), !dbg !25
  store i8* %call, i8** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !27, metadata !DIExpression()), !dbg !32
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !38, metadata !DIExpression()), !dbg !39
  %4 = load i8*, i8** %data, align 8, !dbg !40
  %call1 = call i64 @strlen(i8* %4) #6, !dbg !41
  store i64 %call1, i64* %dataLen, align 8, !dbg !42
  store i64 0, i64* %i, align 8, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !46
  %6 = load i64, i64* %dataLen, align 8, !dbg !48
  %cmp = icmp ult i64 %5, %6, !dbg !49
  br i1 %cmp, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !51
  %8 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !51
  %9 = load i8, i8* %arrayidx, align 1, !dbg !51
  %10 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !55
  store i8 %9, i8* %arrayidx2, align 1, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !58
  %inc = add i64 %11, 1, !dbg !58
  store i64 %inc, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !63
  store i8 0, i8* %arrayidx3, align 1, !dbg !64
  %12 = load i8*, i8** %data, align 8, !dbg !65
  call void @printLine(i8* %12), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !68 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %0 = load i8*, i8** %data.addr, align 8, !dbg !73
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !74
  %1 = load i8*, i8** %data.addr, align 8, !dbg !75
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !75
  store i8 0, i8* %arrayidx, align 1, !dbg !76
  %2 = load i8*, i8** %data.addr, align 8, !dbg !77
  ret i8* %2, !dbg !78
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_42_good() #0 !dbg !79 {
entry:
  call void @goodG2B(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !82 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* null) #7, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #7, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_42_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_42_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !101 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = alloca i8, i64 100, align 16, !dbg !106
  store i8* %0, i8** %dataBuffer, align 8, !dbg !105
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !107
  store i8* %1, i8** %data, align 8, !dbg !108
  %2 = load i8*, i8** %data, align 8, !dbg !109
  %call = call i8* @goodG2BSource(i8* %2), !dbg !110
  store i8* %call, i8** %data, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !112, metadata !DIExpression()), !dbg !114
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !114
  call void @llvm.dbg.declare(metadata i64* %i, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !117, metadata !DIExpression()), !dbg !118
  %4 = load i8*, i8** %data, align 8, !dbg !119
  %call1 = call i64 @strlen(i8* %4) #6, !dbg !120
  store i64 %call1, i64* %dataLen, align 8, !dbg !121
  store i64 0, i64* %i, align 8, !dbg !122
  br label %for.cond, !dbg !124

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !125
  %6 = load i64, i64* %dataLen, align 8, !dbg !127
  %cmp = icmp ult i64 %5, %6, !dbg !128
  br i1 %cmp, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !130
  %8 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !130
  %9 = load i8, i8* %arrayidx, align 1, !dbg !130
  %10 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !134
  store i8 %9, i8* %arrayidx2, align 1, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %11, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !141
  store i8 0, i8* %arrayidx3, align 1, !dbg !142
  %12 = load i8*, i8** %data, align 8, !dbg !143
  call void @printLine(i8* %12), !dbg !144
  ret void, !dbg !145
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2BSource(i8* %data) #0 !dbg !146 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !147, metadata !DIExpression()), !dbg !148
  %0 = load i8*, i8** %data.addr, align 8, !dbg !149
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !150
  %1 = load i8*, i8** %data.addr, align 8, !dbg !151
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !151
  store i8 0, i8* %arrayidx, align 1, !dbg !152
  %2 = load i8*, i8** %data.addr, align 8, !dbg !153
  ret i8* %2, !dbg !154
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
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_42.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_42_bad", scope: !14, file: !14, line: 31, type: !15, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_42.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 33, type: !4)
!18 = !DILocation(line: 33, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 34, type: !4)
!20 = !DILocation(line: 34, column: 12, scope: !13)
!21 = !DILocation(line: 34, column: 33, scope: !13)
!22 = !DILocation(line: 35, column: 12, scope: !13)
!23 = !DILocation(line: 35, column: 10, scope: !13)
!24 = !DILocation(line: 36, column: 22, scope: !13)
!25 = !DILocation(line: 36, column: 12, scope: !13)
!26 = !DILocation(line: 36, column: 10, scope: !13)
!27 = !DILocalVariable(name: "dest", scope: !28, file: !14, line: 38, type: !29)
!28 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 50)
!32 = !DILocation(line: 38, column: 14, scope: !28)
!33 = !DILocalVariable(name: "i", scope: !28, file: !14, line: 39, type: !34)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !35, line: 46, baseType: !36)
!35 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!36 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 39, column: 16, scope: !28)
!38 = !DILocalVariable(name: "dataLen", scope: !28, file: !14, line: 39, type: !34)
!39 = !DILocation(line: 39, column: 19, scope: !28)
!40 = !DILocation(line: 40, column: 26, scope: !28)
!41 = !DILocation(line: 40, column: 19, scope: !28)
!42 = !DILocation(line: 40, column: 17, scope: !28)
!43 = !DILocation(line: 42, column: 16, scope: !44)
!44 = distinct !DILexicalBlock(scope: !28, file: !14, line: 42, column: 9)
!45 = !DILocation(line: 42, column: 14, scope: !44)
!46 = !DILocation(line: 42, column: 21, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !14, line: 42, column: 9)
!48 = !DILocation(line: 42, column: 25, scope: !47)
!49 = !DILocation(line: 42, column: 23, scope: !47)
!50 = !DILocation(line: 42, column: 9, scope: !44)
!51 = !DILocation(line: 44, column: 23, scope: !52)
!52 = distinct !DILexicalBlock(scope: !47, file: !14, line: 43, column: 9)
!53 = !DILocation(line: 44, column: 28, scope: !52)
!54 = !DILocation(line: 44, column: 18, scope: !52)
!55 = !DILocation(line: 44, column: 13, scope: !52)
!56 = !DILocation(line: 44, column: 21, scope: !52)
!57 = !DILocation(line: 45, column: 9, scope: !52)
!58 = !DILocation(line: 42, column: 35, scope: !47)
!59 = !DILocation(line: 42, column: 9, scope: !47)
!60 = distinct !{!60, !50, !61, !62}
!61 = !DILocation(line: 45, column: 9, scope: !44)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 46, column: 9, scope: !28)
!64 = !DILocation(line: 46, column: 20, scope: !28)
!65 = !DILocation(line: 47, column: 19, scope: !28)
!66 = !DILocation(line: 47, column: 9, scope: !28)
!67 = !DILocation(line: 49, column: 1, scope: !13)
!68 = distinct !DISubprogram(name: "badSource", scope: !14, file: !14, line: 23, type: !69, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!4, !4}
!71 = !DILocalVariable(name: "data", arg: 1, scope: !68, file: !14, line: 23, type: !4)
!72 = !DILocation(line: 23, column: 32, scope: !68)
!73 = !DILocation(line: 26, column: 12, scope: !68)
!74 = !DILocation(line: 26, column: 5, scope: !68)
!75 = !DILocation(line: 27, column: 5, scope: !68)
!76 = !DILocation(line: 27, column: 17, scope: !68)
!77 = !DILocation(line: 28, column: 12, scope: !68)
!78 = !DILocation(line: 28, column: 5, scope: !68)
!79 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_42_good", scope: !14, file: !14, line: 84, type: !15, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 86, column: 5, scope: !79)
!81 = !DILocation(line: 87, column: 1, scope: !79)
!82 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 99, type: !83, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DISubroutineType(types: !84)
!84 = !{!85, !85, !86}
!85 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !14, line: 99, type: !85)
!88 = !DILocation(line: 99, column: 14, scope: !82)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !14, line: 99, type: !86)
!90 = !DILocation(line: 99, column: 27, scope: !82)
!91 = !DILocation(line: 102, column: 22, scope: !82)
!92 = !DILocation(line: 102, column: 12, scope: !82)
!93 = !DILocation(line: 102, column: 5, scope: !82)
!94 = !DILocation(line: 104, column: 5, scope: !82)
!95 = !DILocation(line: 105, column: 5, scope: !82)
!96 = !DILocation(line: 106, column: 5, scope: !82)
!97 = !DILocation(line: 109, column: 5, scope: !82)
!98 = !DILocation(line: 110, column: 5, scope: !82)
!99 = !DILocation(line: 111, column: 5, scope: !82)
!100 = !DILocation(line: 113, column: 5, scope: !82)
!101 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 64, type: !15, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !14, line: 66, type: !4)
!103 = !DILocation(line: 66, column: 12, scope: !101)
!104 = !DILocalVariable(name: "dataBuffer", scope: !101, file: !14, line: 67, type: !4)
!105 = !DILocation(line: 67, column: 12, scope: !101)
!106 = !DILocation(line: 67, column: 33, scope: !101)
!107 = !DILocation(line: 68, column: 12, scope: !101)
!108 = !DILocation(line: 68, column: 10, scope: !101)
!109 = !DILocation(line: 69, column: 26, scope: !101)
!110 = !DILocation(line: 69, column: 12, scope: !101)
!111 = !DILocation(line: 69, column: 10, scope: !101)
!112 = !DILocalVariable(name: "dest", scope: !113, file: !14, line: 71, type: !29)
!113 = distinct !DILexicalBlock(scope: !101, file: !14, line: 70, column: 5)
!114 = !DILocation(line: 71, column: 14, scope: !113)
!115 = !DILocalVariable(name: "i", scope: !113, file: !14, line: 72, type: !34)
!116 = !DILocation(line: 72, column: 16, scope: !113)
!117 = !DILocalVariable(name: "dataLen", scope: !113, file: !14, line: 72, type: !34)
!118 = !DILocation(line: 72, column: 19, scope: !113)
!119 = !DILocation(line: 73, column: 26, scope: !113)
!120 = !DILocation(line: 73, column: 19, scope: !113)
!121 = !DILocation(line: 73, column: 17, scope: !113)
!122 = !DILocation(line: 75, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !113, file: !14, line: 75, column: 9)
!124 = !DILocation(line: 75, column: 14, scope: !123)
!125 = !DILocation(line: 75, column: 21, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !14, line: 75, column: 9)
!127 = !DILocation(line: 75, column: 25, scope: !126)
!128 = !DILocation(line: 75, column: 23, scope: !126)
!129 = !DILocation(line: 75, column: 9, scope: !123)
!130 = !DILocation(line: 77, column: 23, scope: !131)
!131 = distinct !DILexicalBlock(scope: !126, file: !14, line: 76, column: 9)
!132 = !DILocation(line: 77, column: 28, scope: !131)
!133 = !DILocation(line: 77, column: 18, scope: !131)
!134 = !DILocation(line: 77, column: 13, scope: !131)
!135 = !DILocation(line: 77, column: 21, scope: !131)
!136 = !DILocation(line: 78, column: 9, scope: !131)
!137 = !DILocation(line: 75, column: 35, scope: !126)
!138 = !DILocation(line: 75, column: 9, scope: !126)
!139 = distinct !{!139, !129, !140, !62}
!140 = !DILocation(line: 78, column: 9, scope: !123)
!141 = !DILocation(line: 79, column: 9, scope: !113)
!142 = !DILocation(line: 79, column: 20, scope: !113)
!143 = !DILocation(line: 80, column: 19, scope: !113)
!144 = !DILocation(line: 80, column: 9, scope: !113)
!145 = !DILocation(line: 82, column: 1, scope: !101)
!146 = distinct !DISubprogram(name: "goodG2BSource", scope: !14, file: !14, line: 55, type: !69, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!147 = !DILocalVariable(name: "data", arg: 1, scope: !146, file: !14, line: 55, type: !4)
!148 = !DILocation(line: 55, column: 36, scope: !146)
!149 = !DILocation(line: 58, column: 12, scope: !146)
!150 = !DILocation(line: 58, column: 5, scope: !146)
!151 = !DILocation(line: 59, column: 5, scope: !146)
!152 = !DILocation(line: 59, column: 16, scope: !146)
!153 = !DILocation(line: 60, column: 12, scope: !146)
!154 = !DILocation(line: 60, column: 5, scope: !146)
