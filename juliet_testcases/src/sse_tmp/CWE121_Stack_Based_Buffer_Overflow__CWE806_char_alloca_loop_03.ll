; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_03.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_03_bad() #0 !dbg !13 {
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
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !27
  %3 = load i8*, i8** %data, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !30, metadata !DIExpression()), !dbg !35
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !41, metadata !DIExpression()), !dbg !42
  %5 = load i8*, i8** %data, align 8, !dbg !43
  %call = call i64 @strlen(i8* %5) #6, !dbg !44
  store i64 %call, i64* %dataLen, align 8, !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !49
  %7 = load i64, i64* %dataLen, align 8, !dbg !51
  %cmp = icmp ult i64 %6, %7, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !54
  %9 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx1 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !54
  %10 = load i8, i8* %arrayidx1, align 1, !dbg !54
  %11 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !58
  store i8 %10, i8* %arrayidx2, align 1, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %12, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !66
  store i8 0, i8* %arrayidx3, align 1, !dbg !67
  %13 = load i8*, i8** %data, align 8, !dbg !68
  call void @printLine(i8* %13), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_03_good() #0 !dbg !71 {
entry:
  call void @goodG2B1(), !dbg !72
  call void @goodG2B2(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #7, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #7, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_03_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_03_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !94 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %0 = alloca i8, i64 100, align 16, !dbg !99
  store i8* %0, i8** %dataBuffer, align 8, !dbg !98
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !100
  store i8* %1, i8** %data, align 8, !dbg !101
  %2 = load i8*, i8** %data, align 8, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !105
  %3 = load i8*, i8** %data, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !106
  store i8 0, i8* %arrayidx, align 1, !dbg !107
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !108, metadata !DIExpression()), !dbg !110
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !110
  call void @llvm.dbg.declare(metadata i64* %i, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !113, metadata !DIExpression()), !dbg !114
  %5 = load i8*, i8** %data, align 8, !dbg !115
  %call = call i64 @strlen(i8* %5) #6, !dbg !116
  store i64 %call, i64* %dataLen, align 8, !dbg !117
  store i64 0, i64* %i, align 8, !dbg !118
  br label %for.cond, !dbg !120

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !121
  %7 = load i64, i64* %dataLen, align 8, !dbg !123
  %cmp = icmp ult i64 %6, %7, !dbg !124
  br i1 %cmp, label %for.body, label %for.end, !dbg !125

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !126
  %9 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx1 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !126
  %10 = load i8, i8* %arrayidx1, align 1, !dbg !126
  %11 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !130
  store i8 %10, i8* %arrayidx2, align 1, !dbg !131
  br label %for.inc, !dbg !132

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !133
  %inc = add i64 %12, 1, !dbg !133
  store i64 %inc, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !134, !llvm.loop !135

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !137
  store i8 0, i8* %arrayidx3, align 1, !dbg !138
  %13 = load i8*, i8** %data, align 8, !dbg !139
  call void @printLine(i8* %13), !dbg !140
  ret void, !dbg !141
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !142 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !145, metadata !DIExpression()), !dbg !146
  %0 = alloca i8, i64 100, align 16, !dbg !147
  store i8* %0, i8** %dataBuffer, align 8, !dbg !146
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !148
  store i8* %1, i8** %data, align 8, !dbg !149
  %2 = load i8*, i8** %data, align 8, !dbg !150
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !153
  %3 = load i8*, i8** %data, align 8, !dbg !154
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !154
  store i8 0, i8* %arrayidx, align 1, !dbg !155
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !156, metadata !DIExpression()), !dbg !158
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !158
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !158
  call void @llvm.dbg.declare(metadata i64* %i, metadata !159, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !161, metadata !DIExpression()), !dbg !162
  %5 = load i8*, i8** %data, align 8, !dbg !163
  %call = call i64 @strlen(i8* %5) #6, !dbg !164
  store i64 %call, i64* %dataLen, align 8, !dbg !165
  store i64 0, i64* %i, align 8, !dbg !166
  br label %for.cond, !dbg !168

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !169
  %7 = load i64, i64* %dataLen, align 8, !dbg !171
  %cmp = icmp ult i64 %6, %7, !dbg !172
  br i1 %cmp, label %for.body, label %for.end, !dbg !173

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !174
  %9 = load i64, i64* %i, align 8, !dbg !176
  %arrayidx1 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !174
  %10 = load i8, i8* %arrayidx1, align 1, !dbg !174
  %11 = load i64, i64* %i, align 8, !dbg !177
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !178
  store i8 %10, i8* %arrayidx2, align 1, !dbg !179
  br label %for.inc, !dbg !180

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !181
  %inc = add i64 %12, 1, !dbg !181
  store i64 %inc, i64* %i, align 8, !dbg !181
  br label %for.cond, !dbg !182, !llvm.loop !183

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !185
  store i8 0, i8* %arrayidx3, align 1, !dbg !186
  %13 = load i8*, i8** %data, align 8, !dbg !187
  call void @printLine(i8* %13), !dbg !188
  ret void, !dbg !189
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_03.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_03_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_03.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 10, scope: !13)
!24 = !DILocation(line: 31, column: 16, scope: !25)
!25 = distinct !DILexicalBlock(scope: !26, file: !14, line: 29, column: 5)
!26 = distinct !DILexicalBlock(scope: !13, file: !14, line: 28, column: 8)
!27 = !DILocation(line: 31, column: 9, scope: !25)
!28 = !DILocation(line: 32, column: 9, scope: !25)
!29 = !DILocation(line: 32, column: 21, scope: !25)
!30 = !DILocalVariable(name: "dest", scope: !31, file: !14, line: 35, type: !32)
!31 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 50)
!35 = !DILocation(line: 35, column: 14, scope: !31)
!36 = !DILocalVariable(name: "i", scope: !31, file: !14, line: 36, type: !37)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 46, baseType: !39)
!38 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!39 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 36, column: 16, scope: !31)
!41 = !DILocalVariable(name: "dataLen", scope: !31, file: !14, line: 36, type: !37)
!42 = !DILocation(line: 36, column: 19, scope: !31)
!43 = !DILocation(line: 37, column: 26, scope: !31)
!44 = !DILocation(line: 37, column: 19, scope: !31)
!45 = !DILocation(line: 37, column: 17, scope: !31)
!46 = !DILocation(line: 39, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !31, file: !14, line: 39, column: 9)
!48 = !DILocation(line: 39, column: 14, scope: !47)
!49 = !DILocation(line: 39, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !14, line: 39, column: 9)
!51 = !DILocation(line: 39, column: 25, scope: !50)
!52 = !DILocation(line: 39, column: 23, scope: !50)
!53 = !DILocation(line: 39, column: 9, scope: !47)
!54 = !DILocation(line: 41, column: 23, scope: !55)
!55 = distinct !DILexicalBlock(scope: !50, file: !14, line: 40, column: 9)
!56 = !DILocation(line: 41, column: 28, scope: !55)
!57 = !DILocation(line: 41, column: 18, scope: !55)
!58 = !DILocation(line: 41, column: 13, scope: !55)
!59 = !DILocation(line: 41, column: 21, scope: !55)
!60 = !DILocation(line: 42, column: 9, scope: !55)
!61 = !DILocation(line: 39, column: 35, scope: !50)
!62 = !DILocation(line: 39, column: 9, scope: !50)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 42, column: 9, scope: !47)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 43, column: 9, scope: !31)
!67 = !DILocation(line: 43, column: 20, scope: !31)
!68 = !DILocation(line: 44, column: 19, scope: !31)
!69 = !DILocation(line: 44, column: 9, scope: !31)
!70 = !DILocation(line: 46, column: 1, scope: !13)
!71 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_03_good", scope: !14, file: !14, line: 109, type: !15, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 111, column: 5, scope: !71)
!73 = !DILocation(line: 112, column: 5, scope: !71)
!74 = !DILocation(line: 113, column: 1, scope: !71)
!75 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 125, type: !76, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!78, !78, !79}
!78 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !14, line: 125, type: !78)
!81 = !DILocation(line: 125, column: 14, scope: !75)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !14, line: 125, type: !79)
!83 = !DILocation(line: 125, column: 27, scope: !75)
!84 = !DILocation(line: 128, column: 22, scope: !75)
!85 = !DILocation(line: 128, column: 12, scope: !75)
!86 = !DILocation(line: 128, column: 5, scope: !75)
!87 = !DILocation(line: 130, column: 5, scope: !75)
!88 = !DILocation(line: 131, column: 5, scope: !75)
!89 = !DILocation(line: 132, column: 5, scope: !75)
!90 = !DILocation(line: 135, column: 5, scope: !75)
!91 = !DILocation(line: 136, column: 5, scope: !75)
!92 = !DILocation(line: 137, column: 5, scope: !75)
!93 = !DILocation(line: 139, column: 5, scope: !75)
!94 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !14, line: 55, type: !4)
!96 = !DILocation(line: 55, column: 12, scope: !94)
!97 = !DILocalVariable(name: "dataBuffer", scope: !94, file: !14, line: 56, type: !4)
!98 = !DILocation(line: 56, column: 12, scope: !94)
!99 = !DILocation(line: 56, column: 33, scope: !94)
!100 = !DILocation(line: 57, column: 12, scope: !94)
!101 = !DILocation(line: 57, column: 10, scope: !94)
!102 = !DILocation(line: 66, column: 16, scope: !103)
!103 = distinct !DILexicalBlock(scope: !104, file: !14, line: 64, column: 5)
!104 = distinct !DILexicalBlock(scope: !94, file: !14, line: 58, column: 8)
!105 = !DILocation(line: 66, column: 9, scope: !103)
!106 = !DILocation(line: 67, column: 9, scope: !103)
!107 = !DILocation(line: 67, column: 20, scope: !103)
!108 = !DILocalVariable(name: "dest", scope: !109, file: !14, line: 70, type: !32)
!109 = distinct !DILexicalBlock(scope: !94, file: !14, line: 69, column: 5)
!110 = !DILocation(line: 70, column: 14, scope: !109)
!111 = !DILocalVariable(name: "i", scope: !109, file: !14, line: 71, type: !37)
!112 = !DILocation(line: 71, column: 16, scope: !109)
!113 = !DILocalVariable(name: "dataLen", scope: !109, file: !14, line: 71, type: !37)
!114 = !DILocation(line: 71, column: 19, scope: !109)
!115 = !DILocation(line: 72, column: 26, scope: !109)
!116 = !DILocation(line: 72, column: 19, scope: !109)
!117 = !DILocation(line: 72, column: 17, scope: !109)
!118 = !DILocation(line: 74, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !109, file: !14, line: 74, column: 9)
!120 = !DILocation(line: 74, column: 14, scope: !119)
!121 = !DILocation(line: 74, column: 21, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !14, line: 74, column: 9)
!123 = !DILocation(line: 74, column: 25, scope: !122)
!124 = !DILocation(line: 74, column: 23, scope: !122)
!125 = !DILocation(line: 74, column: 9, scope: !119)
!126 = !DILocation(line: 76, column: 23, scope: !127)
!127 = distinct !DILexicalBlock(scope: !122, file: !14, line: 75, column: 9)
!128 = !DILocation(line: 76, column: 28, scope: !127)
!129 = !DILocation(line: 76, column: 18, scope: !127)
!130 = !DILocation(line: 76, column: 13, scope: !127)
!131 = !DILocation(line: 76, column: 21, scope: !127)
!132 = !DILocation(line: 77, column: 9, scope: !127)
!133 = !DILocation(line: 74, column: 35, scope: !122)
!134 = !DILocation(line: 74, column: 9, scope: !122)
!135 = distinct !{!135, !125, !136, !65}
!136 = !DILocation(line: 77, column: 9, scope: !119)
!137 = !DILocation(line: 78, column: 9, scope: !109)
!138 = !DILocation(line: 78, column: 20, scope: !109)
!139 = !DILocation(line: 79, column: 19, scope: !109)
!140 = !DILocation(line: 79, column: 9, scope: !109)
!141 = !DILocation(line: 81, column: 1, scope: !94)
!142 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 84, type: !15, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!143 = !DILocalVariable(name: "data", scope: !142, file: !14, line: 86, type: !4)
!144 = !DILocation(line: 86, column: 12, scope: !142)
!145 = !DILocalVariable(name: "dataBuffer", scope: !142, file: !14, line: 87, type: !4)
!146 = !DILocation(line: 87, column: 12, scope: !142)
!147 = !DILocation(line: 87, column: 33, scope: !142)
!148 = !DILocation(line: 88, column: 12, scope: !142)
!149 = !DILocation(line: 88, column: 10, scope: !142)
!150 = !DILocation(line: 92, column: 16, scope: !151)
!151 = distinct !DILexicalBlock(scope: !152, file: !14, line: 90, column: 5)
!152 = distinct !DILexicalBlock(scope: !142, file: !14, line: 89, column: 8)
!153 = !DILocation(line: 92, column: 9, scope: !151)
!154 = !DILocation(line: 93, column: 9, scope: !151)
!155 = !DILocation(line: 93, column: 20, scope: !151)
!156 = !DILocalVariable(name: "dest", scope: !157, file: !14, line: 96, type: !32)
!157 = distinct !DILexicalBlock(scope: !142, file: !14, line: 95, column: 5)
!158 = !DILocation(line: 96, column: 14, scope: !157)
!159 = !DILocalVariable(name: "i", scope: !157, file: !14, line: 97, type: !37)
!160 = !DILocation(line: 97, column: 16, scope: !157)
!161 = !DILocalVariable(name: "dataLen", scope: !157, file: !14, line: 97, type: !37)
!162 = !DILocation(line: 97, column: 19, scope: !157)
!163 = !DILocation(line: 98, column: 26, scope: !157)
!164 = !DILocation(line: 98, column: 19, scope: !157)
!165 = !DILocation(line: 98, column: 17, scope: !157)
!166 = !DILocation(line: 100, column: 16, scope: !167)
!167 = distinct !DILexicalBlock(scope: !157, file: !14, line: 100, column: 9)
!168 = !DILocation(line: 100, column: 14, scope: !167)
!169 = !DILocation(line: 100, column: 21, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !14, line: 100, column: 9)
!171 = !DILocation(line: 100, column: 25, scope: !170)
!172 = !DILocation(line: 100, column: 23, scope: !170)
!173 = !DILocation(line: 100, column: 9, scope: !167)
!174 = !DILocation(line: 102, column: 23, scope: !175)
!175 = distinct !DILexicalBlock(scope: !170, file: !14, line: 101, column: 9)
!176 = !DILocation(line: 102, column: 28, scope: !175)
!177 = !DILocation(line: 102, column: 18, scope: !175)
!178 = !DILocation(line: 102, column: 13, scope: !175)
!179 = !DILocation(line: 102, column: 21, scope: !175)
!180 = !DILocation(line: 103, column: 9, scope: !175)
!181 = !DILocation(line: 100, column: 35, scope: !170)
!182 = !DILocation(line: 100, column: 9, scope: !170)
!183 = distinct !{!183, !173, !184, !65}
!184 = !DILocation(line: 103, column: 9, scope: !167)
!185 = !DILocation(line: 104, column: 9, scope: !157)
!186 = !DILocation(line: 104, column: 20, scope: !157)
!187 = !DILocation(line: 105, column: 19, scope: !157)
!188 = !DILocation(line: 105, column: 9, scope: !157)
!189 = !DILocation(line: 107, column: 1, scope: !142)
