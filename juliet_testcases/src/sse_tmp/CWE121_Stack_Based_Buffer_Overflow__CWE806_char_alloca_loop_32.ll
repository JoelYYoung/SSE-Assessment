; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_32_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 100, align 16, !dbg !26
  store i8* %0, i8** %dataBuffer, align 8, !dbg !25
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !27
  store i8* %1, i8** %data, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !29, metadata !DIExpression()), !dbg !31
  %2 = load i8**, i8*** %dataPtr1, align 8, !dbg !32
  %3 = load i8*, i8** %2, align 8, !dbg !33
  store i8* %3, i8** %data1, align 8, !dbg !31
  %4 = load i8*, i8** %data1, align 8, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !35
  %5 = load i8*, i8** %data1, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 99, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  %6 = load i8*, i8** %data1, align 8, !dbg !38
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !39
  store i8* %6, i8** %7, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !41, metadata !DIExpression()), !dbg !43
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !44
  %9 = load i8*, i8** %8, align 8, !dbg !45
  store i8* %9, i8** %data2, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !46, metadata !DIExpression()), !dbg !51
  %10 = bitcast [50 x i8]* %dest to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 50, i1 false), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %i, metadata !52, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !57, metadata !DIExpression()), !dbg !58
  %11 = load i8*, i8** %data2, align 8, !dbg !59
  %call = call i64 @strlen(i8* %11) #6, !dbg !60
  store i64 %call, i64* %dataLen, align 8, !dbg !61
  store i64 0, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %entry
  %12 = load i64, i64* %i, align 8, !dbg !65
  %13 = load i64, i64* %dataLen, align 8, !dbg !67
  %cmp = icmp ult i64 %12, %13, !dbg !68
  br i1 %cmp, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  %14 = load i8*, i8** %data2, align 8, !dbg !70
  %15 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx3 = getelementptr inbounds i8, i8* %14, i64 %15, !dbg !70
  %16 = load i8, i8* %arrayidx3, align 1, !dbg !70
  %17 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %17, !dbg !74
  store i8 %16, i8* %arrayidx4, align 1, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %18 = load i64, i64* %i, align 8, !dbg !77
  %inc = add i64 %18, 1, !dbg !77
  store i64 %inc, i64* %i, align 8, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !82
  store i8 0, i8* %arrayidx5, align 1, !dbg !83
  %19 = load i8*, i8** %data2, align 8, !dbg !84
  call void @printLine(i8* %19), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_32_good() #0 !dbg !87 {
entry:
  call void @goodG2B(), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !90 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call i64 @time(i64* null) #7, !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 %conv) #7, !dbg !100
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_32_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_32_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !108 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !111, metadata !DIExpression()), !dbg !112
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !113, metadata !DIExpression()), !dbg !114
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %0 = alloca i8, i64 100, align 16, !dbg !117
  store i8* %0, i8** %dataBuffer, align 8, !dbg !116
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !118
  store i8* %1, i8** %data, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !120, metadata !DIExpression()), !dbg !122
  %2 = load i8**, i8*** %dataPtr1, align 8, !dbg !123
  %3 = load i8*, i8** %2, align 8, !dbg !124
  store i8* %3, i8** %data1, align 8, !dbg !122
  %4 = load i8*, i8** %data1, align 8, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 49, i1 false), !dbg !126
  %5 = load i8*, i8** %data1, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !127
  store i8 0, i8* %arrayidx, align 1, !dbg !128
  %6 = load i8*, i8** %data1, align 8, !dbg !129
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !130
  store i8* %6, i8** %7, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !132, metadata !DIExpression()), !dbg !134
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !135
  %9 = load i8*, i8** %8, align 8, !dbg !136
  store i8* %9, i8** %data2, align 8, !dbg !134
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !137, metadata !DIExpression()), !dbg !139
  %10 = bitcast [50 x i8]* %dest to i8*, !dbg !139
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 50, i1 false), !dbg !139
  call void @llvm.dbg.declare(metadata i64* %i, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !142, metadata !DIExpression()), !dbg !143
  %11 = load i8*, i8** %data2, align 8, !dbg !144
  %call = call i64 @strlen(i8* %11) #6, !dbg !145
  store i64 %call, i64* %dataLen, align 8, !dbg !146
  store i64 0, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !149

for.cond:                                         ; preds = %for.inc, %entry
  %12 = load i64, i64* %i, align 8, !dbg !150
  %13 = load i64, i64* %dataLen, align 8, !dbg !152
  %cmp = icmp ult i64 %12, %13, !dbg !153
  br i1 %cmp, label %for.body, label %for.end, !dbg !154

for.body:                                         ; preds = %for.cond
  %14 = load i8*, i8** %data2, align 8, !dbg !155
  %15 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx3 = getelementptr inbounds i8, i8* %14, i64 %15, !dbg !155
  %16 = load i8, i8* %arrayidx3, align 1, !dbg !155
  %17 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %17, !dbg !159
  store i8 %16, i8* %arrayidx4, align 1, !dbg !160
  br label %for.inc, !dbg !161

for.inc:                                          ; preds = %for.body
  %18 = load i64, i64* %i, align 8, !dbg !162
  %inc = add i64 %18, 1, !dbg !162
  store i64 %inc, i64* %i, align 8, !dbg !162
  br label %for.cond, !dbg !163, !llvm.loop !164

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !166
  store i8 0, i8* %arrayidx5, align 1, !dbg !167
  %19 = load i8*, i8** %data2, align 8, !dbg !168
  call void @printLine(i8* %19), !dbg !169
  ret void, !dbg !170
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_32.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_32_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_32.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataPtr1", scope: !13, file: !14, line: 26, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!21 = !DILocation(line: 26, column: 13, scope: !13)
!22 = !DILocalVariable(name: "dataPtr2", scope: !13, file: !14, line: 27, type: !20)
!23 = !DILocation(line: 27, column: 13, scope: !13)
!24 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 28, type: !4)
!25 = !DILocation(line: 28, column: 12, scope: !13)
!26 = !DILocation(line: 28, column: 33, scope: !13)
!27 = !DILocation(line: 29, column: 12, scope: !13)
!28 = !DILocation(line: 29, column: 10, scope: !13)
!29 = !DILocalVariable(name: "data", scope: !30, file: !14, line: 31, type: !4)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 30, column: 5)
!31 = !DILocation(line: 31, column: 16, scope: !30)
!32 = !DILocation(line: 31, column: 24, scope: !30)
!33 = !DILocation(line: 31, column: 23, scope: !30)
!34 = !DILocation(line: 33, column: 16, scope: !30)
!35 = !DILocation(line: 33, column: 9, scope: !30)
!36 = !DILocation(line: 34, column: 9, scope: !30)
!37 = !DILocation(line: 34, column: 21, scope: !30)
!38 = !DILocation(line: 35, column: 21, scope: !30)
!39 = !DILocation(line: 35, column: 10, scope: !30)
!40 = !DILocation(line: 35, column: 19, scope: !30)
!41 = !DILocalVariable(name: "data", scope: !42, file: !14, line: 38, type: !4)
!42 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!43 = !DILocation(line: 38, column: 16, scope: !42)
!44 = !DILocation(line: 38, column: 24, scope: !42)
!45 = !DILocation(line: 38, column: 23, scope: !42)
!46 = !DILocalVariable(name: "dest", scope: !47, file: !14, line: 40, type: !48)
!47 = distinct !DILexicalBlock(scope: !42, file: !14, line: 39, column: 9)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 50)
!51 = !DILocation(line: 40, column: 18, scope: !47)
!52 = !DILocalVariable(name: "i", scope: !47, file: !14, line: 41, type: !53)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !54, line: 46, baseType: !55)
!54 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!55 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 41, column: 20, scope: !47)
!57 = !DILocalVariable(name: "dataLen", scope: !47, file: !14, line: 41, type: !53)
!58 = !DILocation(line: 41, column: 23, scope: !47)
!59 = !DILocation(line: 42, column: 30, scope: !47)
!60 = !DILocation(line: 42, column: 23, scope: !47)
!61 = !DILocation(line: 42, column: 21, scope: !47)
!62 = !DILocation(line: 44, column: 20, scope: !63)
!63 = distinct !DILexicalBlock(scope: !47, file: !14, line: 44, column: 13)
!64 = !DILocation(line: 44, column: 18, scope: !63)
!65 = !DILocation(line: 44, column: 25, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !14, line: 44, column: 13)
!67 = !DILocation(line: 44, column: 29, scope: !66)
!68 = !DILocation(line: 44, column: 27, scope: !66)
!69 = !DILocation(line: 44, column: 13, scope: !63)
!70 = !DILocation(line: 46, column: 27, scope: !71)
!71 = distinct !DILexicalBlock(scope: !66, file: !14, line: 45, column: 13)
!72 = !DILocation(line: 46, column: 32, scope: !71)
!73 = !DILocation(line: 46, column: 22, scope: !71)
!74 = !DILocation(line: 46, column: 17, scope: !71)
!75 = !DILocation(line: 46, column: 25, scope: !71)
!76 = !DILocation(line: 47, column: 13, scope: !71)
!77 = !DILocation(line: 44, column: 39, scope: !66)
!78 = !DILocation(line: 44, column: 13, scope: !66)
!79 = distinct !{!79, !69, !80, !81}
!80 = !DILocation(line: 47, column: 13, scope: !63)
!81 = !{!"llvm.loop.mustprogress"}
!82 = !DILocation(line: 48, column: 13, scope: !47)
!83 = !DILocation(line: 48, column: 24, scope: !47)
!84 = !DILocation(line: 49, column: 23, scope: !47)
!85 = !DILocation(line: 49, column: 13, scope: !47)
!86 = !DILocation(line: 52, column: 1, scope: !13)
!87 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_32_good", scope: !14, file: !14, line: 90, type: !15, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocation(line: 92, column: 5, scope: !87)
!89 = !DILocation(line: 93, column: 1, scope: !87)
!90 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 104, type: !91, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DISubroutineType(types: !92)
!92 = !{!93, !93, !20}
!93 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !14, line: 104, type: !93)
!95 = !DILocation(line: 104, column: 14, scope: !90)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !14, line: 104, type: !20)
!97 = !DILocation(line: 104, column: 27, scope: !90)
!98 = !DILocation(line: 107, column: 22, scope: !90)
!99 = !DILocation(line: 107, column: 12, scope: !90)
!100 = !DILocation(line: 107, column: 5, scope: !90)
!101 = !DILocation(line: 109, column: 5, scope: !90)
!102 = !DILocation(line: 110, column: 5, scope: !90)
!103 = !DILocation(line: 111, column: 5, scope: !90)
!104 = !DILocation(line: 114, column: 5, scope: !90)
!105 = !DILocation(line: 115, column: 5, scope: !90)
!106 = !DILocation(line: 116, column: 5, scope: !90)
!107 = !DILocation(line: 118, column: 5, scope: !90)
!108 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 59, type: !15, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !14, line: 61, type: !4)
!110 = !DILocation(line: 61, column: 12, scope: !108)
!111 = !DILocalVariable(name: "dataPtr1", scope: !108, file: !14, line: 62, type: !20)
!112 = !DILocation(line: 62, column: 13, scope: !108)
!113 = !DILocalVariable(name: "dataPtr2", scope: !108, file: !14, line: 63, type: !20)
!114 = !DILocation(line: 63, column: 13, scope: !108)
!115 = !DILocalVariable(name: "dataBuffer", scope: !108, file: !14, line: 64, type: !4)
!116 = !DILocation(line: 64, column: 12, scope: !108)
!117 = !DILocation(line: 64, column: 33, scope: !108)
!118 = !DILocation(line: 65, column: 12, scope: !108)
!119 = !DILocation(line: 65, column: 10, scope: !108)
!120 = !DILocalVariable(name: "data", scope: !121, file: !14, line: 67, type: !4)
!121 = distinct !DILexicalBlock(scope: !108, file: !14, line: 66, column: 5)
!122 = !DILocation(line: 67, column: 16, scope: !121)
!123 = !DILocation(line: 67, column: 24, scope: !121)
!124 = !DILocation(line: 67, column: 23, scope: !121)
!125 = !DILocation(line: 69, column: 16, scope: !121)
!126 = !DILocation(line: 69, column: 9, scope: !121)
!127 = !DILocation(line: 70, column: 9, scope: !121)
!128 = !DILocation(line: 70, column: 20, scope: !121)
!129 = !DILocation(line: 71, column: 21, scope: !121)
!130 = !DILocation(line: 71, column: 10, scope: !121)
!131 = !DILocation(line: 71, column: 19, scope: !121)
!132 = !DILocalVariable(name: "data", scope: !133, file: !14, line: 74, type: !4)
!133 = distinct !DILexicalBlock(scope: !108, file: !14, line: 73, column: 5)
!134 = !DILocation(line: 74, column: 16, scope: !133)
!135 = !DILocation(line: 74, column: 24, scope: !133)
!136 = !DILocation(line: 74, column: 23, scope: !133)
!137 = !DILocalVariable(name: "dest", scope: !138, file: !14, line: 76, type: !48)
!138 = distinct !DILexicalBlock(scope: !133, file: !14, line: 75, column: 9)
!139 = !DILocation(line: 76, column: 18, scope: !138)
!140 = !DILocalVariable(name: "i", scope: !138, file: !14, line: 77, type: !53)
!141 = !DILocation(line: 77, column: 20, scope: !138)
!142 = !DILocalVariable(name: "dataLen", scope: !138, file: !14, line: 77, type: !53)
!143 = !DILocation(line: 77, column: 23, scope: !138)
!144 = !DILocation(line: 78, column: 30, scope: !138)
!145 = !DILocation(line: 78, column: 23, scope: !138)
!146 = !DILocation(line: 78, column: 21, scope: !138)
!147 = !DILocation(line: 80, column: 20, scope: !148)
!148 = distinct !DILexicalBlock(scope: !138, file: !14, line: 80, column: 13)
!149 = !DILocation(line: 80, column: 18, scope: !148)
!150 = !DILocation(line: 80, column: 25, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !14, line: 80, column: 13)
!152 = !DILocation(line: 80, column: 29, scope: !151)
!153 = !DILocation(line: 80, column: 27, scope: !151)
!154 = !DILocation(line: 80, column: 13, scope: !148)
!155 = !DILocation(line: 82, column: 27, scope: !156)
!156 = distinct !DILexicalBlock(scope: !151, file: !14, line: 81, column: 13)
!157 = !DILocation(line: 82, column: 32, scope: !156)
!158 = !DILocation(line: 82, column: 22, scope: !156)
!159 = !DILocation(line: 82, column: 17, scope: !156)
!160 = !DILocation(line: 82, column: 25, scope: !156)
!161 = !DILocation(line: 83, column: 13, scope: !156)
!162 = !DILocation(line: 80, column: 39, scope: !151)
!163 = !DILocation(line: 80, column: 13, scope: !151)
!164 = distinct !{!164, !154, !165, !81}
!165 = !DILocation(line: 83, column: 13, scope: !148)
!166 = !DILocation(line: 84, column: 13, scope: !138)
!167 = !DILocation(line: 84, column: 24, scope: !138)
!168 = !DILocation(line: 85, column: 23, scope: !138)
!169 = !DILocation(line: 85, column: 13, scope: !138)
!170 = !DILocation(line: 88, column: 1, scope: !108)
