; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_44_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 100, align 16, !dbg !26
  store i8* %0, i8** %dataBuffer, align 8, !dbg !25
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !27
  store i8* %1, i8** %data, align 8, !dbg !28
  %2 = load i8*, i8** %data, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !30
  %3 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !33
  %5 = load i8*, i8** %data, align 8, !dbg !34
  call void %4(i8* %5), !dbg !33
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !36 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !50, metadata !DIExpression()), !dbg !51
  %1 = load i8*, i8** %data.addr, align 8, !dbg !52
  %call = call i64 @strlen(i8* %1) #6, !dbg !53
  store i64 %call, i64* %dataLen, align 8, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !58
  %3 = load i64, i64* %dataLen, align 8, !dbg !60
  %cmp = icmp ult i64 %2, %3, !dbg !61
  br i1 %cmp, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data.addr, align 8, !dbg !63
  %5 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !63
  %6 = load i8, i8* %arrayidx, align 1, !dbg !63
  %7 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %7, !dbg !67
  store i8 %6, i8* %arrayidx1, align 1, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %8, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !75
  store i8 0, i8* %arrayidx2, align 1, !dbg !76
  %9 = load i8*, i8** %data.addr, align 8, !dbg !77
  call void @printLine(i8* %9), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_44_good() #0 !dbg !80 {
entry:
  call void @goodG2B(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* null) #7, !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 %conv) #7, !dbg !94
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_44_good(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_44_bad(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !102 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !105, metadata !DIExpression()), !dbg !106
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = alloca i8, i64 100, align 16, !dbg !109
  store i8* %0, i8** %dataBuffer, align 8, !dbg !108
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !110
  store i8* %1, i8** %data, align 8, !dbg !111
  %2 = load i8*, i8** %data, align 8, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !113
  %3 = load i8*, i8** %data, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !114
  store i8 0, i8* %arrayidx, align 1, !dbg !115
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !116
  %5 = load i8*, i8** %data, align 8, !dbg !117
  call void %4(i8* %5), !dbg !116
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !119 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !122, metadata !DIExpression()), !dbg !124
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %i, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !127, metadata !DIExpression()), !dbg !128
  %1 = load i8*, i8** %data.addr, align 8, !dbg !129
  %call = call i64 @strlen(i8* %1) #6, !dbg !130
  store i64 %call, i64* %dataLen, align 8, !dbg !131
  store i64 0, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !135
  %3 = load i64, i64* %dataLen, align 8, !dbg !137
  %cmp = icmp ult i64 %2, %3, !dbg !138
  br i1 %cmp, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data.addr, align 8, !dbg !140
  %5 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !140
  %6 = load i8, i8* %arrayidx, align 1, !dbg !140
  %7 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %7, !dbg !144
  store i8 %6, i8* %arrayidx1, align 1, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !147
  %inc = add i64 %8, 1, !dbg !147
  store i64 %inc, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !151
  store i8 0, i8* %arrayidx2, align 1, !dbg !152
  %9 = load i8*, i8** %data.addr, align 8, !dbg !153
  call void @printLine(i8* %9), !dbg !154
  ret void, !dbg !155
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_44_bad", scope: !14, file: !14, line: 39, type: !15, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 41, type: !4)
!18 = !DILocation(line: 41, column: 12, scope: !13)
!19 = !DILocalVariable(name: "funcPtr", scope: !13, file: !14, line: 43, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !4}
!23 = !DILocation(line: 43, column: 12, scope: !13)
!24 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 44, type: !4)
!25 = !DILocation(line: 44, column: 12, scope: !13)
!26 = !DILocation(line: 44, column: 33, scope: !13)
!27 = !DILocation(line: 45, column: 12, scope: !13)
!28 = !DILocation(line: 45, column: 10, scope: !13)
!29 = !DILocation(line: 47, column: 12, scope: !13)
!30 = !DILocation(line: 47, column: 5, scope: !13)
!31 = !DILocation(line: 48, column: 5, scope: !13)
!32 = !DILocation(line: 48, column: 17, scope: !13)
!33 = !DILocation(line: 50, column: 5, scope: !13)
!34 = !DILocation(line: 50, column: 13, scope: !13)
!35 = !DILocation(line: 51, column: 1, scope: !13)
!36 = distinct !DISubprogram(name: "badSink", scope: !14, file: !14, line: 23, type: !21, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DILocalVariable(name: "data", arg: 1, scope: !36, file: !14, line: 23, type: !4)
!38 = !DILocation(line: 23, column: 28, scope: !36)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !14, line: 26, type: !41)
!40 = distinct !DILexicalBlock(scope: !36, file: !14, line: 25, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 50)
!44 = !DILocation(line: 26, column: 14, scope: !40)
!45 = !DILocalVariable(name: "i", scope: !40, file: !14, line: 27, type: !46)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 46, baseType: !48)
!47 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 27, column: 16, scope: !40)
!50 = !DILocalVariable(name: "dataLen", scope: !40, file: !14, line: 27, type: !46)
!51 = !DILocation(line: 27, column: 19, scope: !40)
!52 = !DILocation(line: 28, column: 26, scope: !40)
!53 = !DILocation(line: 28, column: 19, scope: !40)
!54 = !DILocation(line: 28, column: 17, scope: !40)
!55 = !DILocation(line: 30, column: 16, scope: !56)
!56 = distinct !DILexicalBlock(scope: !40, file: !14, line: 30, column: 9)
!57 = !DILocation(line: 30, column: 14, scope: !56)
!58 = !DILocation(line: 30, column: 21, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !14, line: 30, column: 9)
!60 = !DILocation(line: 30, column: 25, scope: !59)
!61 = !DILocation(line: 30, column: 23, scope: !59)
!62 = !DILocation(line: 30, column: 9, scope: !56)
!63 = !DILocation(line: 32, column: 23, scope: !64)
!64 = distinct !DILexicalBlock(scope: !59, file: !14, line: 31, column: 9)
!65 = !DILocation(line: 32, column: 28, scope: !64)
!66 = !DILocation(line: 32, column: 18, scope: !64)
!67 = !DILocation(line: 32, column: 13, scope: !64)
!68 = !DILocation(line: 32, column: 21, scope: !64)
!69 = !DILocation(line: 33, column: 9, scope: !64)
!70 = !DILocation(line: 30, column: 35, scope: !59)
!71 = !DILocation(line: 30, column: 9, scope: !59)
!72 = distinct !{!72, !62, !73, !74}
!73 = !DILocation(line: 33, column: 9, scope: !56)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 34, column: 9, scope: !40)
!76 = !DILocation(line: 34, column: 20, scope: !40)
!77 = !DILocation(line: 35, column: 19, scope: !40)
!78 = !DILocation(line: 35, column: 9, scope: !40)
!79 = !DILocation(line: 37, column: 1, scope: !36)
!80 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_44_good", scope: !14, file: !14, line: 86, type: !15, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocation(line: 88, column: 5, scope: !80)
!82 = !DILocation(line: 89, column: 1, scope: !80)
!83 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 100, type: !84, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!86, !86, !87}
!86 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !14, line: 100, type: !86)
!89 = !DILocation(line: 100, column: 14, scope: !83)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !14, line: 100, type: !87)
!91 = !DILocation(line: 100, column: 27, scope: !83)
!92 = !DILocation(line: 103, column: 22, scope: !83)
!93 = !DILocation(line: 103, column: 12, scope: !83)
!94 = !DILocation(line: 103, column: 5, scope: !83)
!95 = !DILocation(line: 105, column: 5, scope: !83)
!96 = !DILocation(line: 106, column: 5, scope: !83)
!97 = !DILocation(line: 107, column: 5, scope: !83)
!98 = !DILocation(line: 110, column: 5, scope: !83)
!99 = !DILocation(line: 111, column: 5, scope: !83)
!100 = !DILocation(line: 112, column: 5, scope: !83)
!101 = !DILocation(line: 114, column: 5, scope: !83)
!102 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 74, type: !15, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !14, line: 76, type: !4)
!104 = !DILocation(line: 76, column: 12, scope: !102)
!105 = !DILocalVariable(name: "funcPtr", scope: !102, file: !14, line: 77, type: !20)
!106 = !DILocation(line: 77, column: 12, scope: !102)
!107 = !DILocalVariable(name: "dataBuffer", scope: !102, file: !14, line: 78, type: !4)
!108 = !DILocation(line: 78, column: 12, scope: !102)
!109 = !DILocation(line: 78, column: 33, scope: !102)
!110 = !DILocation(line: 79, column: 12, scope: !102)
!111 = !DILocation(line: 79, column: 10, scope: !102)
!112 = !DILocation(line: 81, column: 12, scope: !102)
!113 = !DILocation(line: 81, column: 5, scope: !102)
!114 = !DILocation(line: 82, column: 5, scope: !102)
!115 = !DILocation(line: 82, column: 16, scope: !102)
!116 = !DILocation(line: 83, column: 5, scope: !102)
!117 = !DILocation(line: 83, column: 13, scope: !102)
!118 = !DILocation(line: 84, column: 1, scope: !102)
!119 = distinct !DISubprogram(name: "goodG2BSink", scope: !14, file: !14, line: 58, type: !21, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = !DILocalVariable(name: "data", arg: 1, scope: !119, file: !14, line: 58, type: !4)
!121 = !DILocation(line: 58, column: 32, scope: !119)
!122 = !DILocalVariable(name: "dest", scope: !123, file: !14, line: 61, type: !41)
!123 = distinct !DILexicalBlock(scope: !119, file: !14, line: 60, column: 5)
!124 = !DILocation(line: 61, column: 14, scope: !123)
!125 = !DILocalVariable(name: "i", scope: !123, file: !14, line: 62, type: !46)
!126 = !DILocation(line: 62, column: 16, scope: !123)
!127 = !DILocalVariable(name: "dataLen", scope: !123, file: !14, line: 62, type: !46)
!128 = !DILocation(line: 62, column: 19, scope: !123)
!129 = !DILocation(line: 63, column: 26, scope: !123)
!130 = !DILocation(line: 63, column: 19, scope: !123)
!131 = !DILocation(line: 63, column: 17, scope: !123)
!132 = !DILocation(line: 65, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !123, file: !14, line: 65, column: 9)
!134 = !DILocation(line: 65, column: 14, scope: !133)
!135 = !DILocation(line: 65, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !14, line: 65, column: 9)
!137 = !DILocation(line: 65, column: 25, scope: !136)
!138 = !DILocation(line: 65, column: 23, scope: !136)
!139 = !DILocation(line: 65, column: 9, scope: !133)
!140 = !DILocation(line: 67, column: 23, scope: !141)
!141 = distinct !DILexicalBlock(scope: !136, file: !14, line: 66, column: 9)
!142 = !DILocation(line: 67, column: 28, scope: !141)
!143 = !DILocation(line: 67, column: 18, scope: !141)
!144 = !DILocation(line: 67, column: 13, scope: !141)
!145 = !DILocation(line: 67, column: 21, scope: !141)
!146 = !DILocation(line: 68, column: 9, scope: !141)
!147 = !DILocation(line: 65, column: 35, scope: !136)
!148 = !DILocation(line: 65, column: 9, scope: !136)
!149 = distinct !{!149, !139, !150, !74}
!150 = !DILocation(line: 68, column: 9, scope: !133)
!151 = !DILocation(line: 69, column: 9, scope: !123)
!152 = !DILocation(line: 69, column: 20, scope: !123)
!153 = !DILocation(line: 70, column: 19, scope: !123)
!154 = !DILocation(line: 70, column: 9, scope: !123)
!155 = !DILocation(line: 72, column: 1, scope: !119)
