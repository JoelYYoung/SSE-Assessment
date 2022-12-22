; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_15_bad() #0 !dbg !13 {
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
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !25
  %3 = load i8*, i8** %data, align 8, !dbg !26
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !26
  store i8 0, i8* %arrayidx, align 1, !dbg !27
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !28, metadata !DIExpression()), !dbg !33
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !39, metadata !DIExpression()), !dbg !40
  %5 = load i8*, i8** %data, align 8, !dbg !41
  %call = call i64 @strlen(i8* %5) #6, !dbg !42
  store i64 %call, i64* %dataLen, align 8, !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !47
  %7 = load i64, i64* %dataLen, align 8, !dbg !49
  %cmp = icmp ult i64 %6, %7, !dbg !50
  br i1 %cmp, label %for.body, label %for.end, !dbg !51

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !52
  %9 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx1 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !52
  %10 = load i8, i8* %arrayidx1, align 1, !dbg !52
  %11 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !56
  store i8 %10, i8* %arrayidx2, align 1, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !59
  %inc = add i64 %12, 1, !dbg !59
  store i64 %inc, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !64
  store i8 0, i8* %arrayidx3, align 1, !dbg !65
  %13 = load i8*, i8** %data, align 8, !dbg !66
  call void @printLine(i8* %13), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_15_good() #0 !dbg !69 {
entry:
  call void @goodG2B1(), !dbg !70
  call void @goodG2B2(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #7, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #7, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_15_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_15_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !92 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %0 = alloca i8, i64 100, align 16, !dbg !97
  store i8* %0, i8** %dataBuffer, align 8, !dbg !96
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !98
  store i8* %1, i8** %data, align 8, !dbg !99
  %2 = load i8*, i8** %data, align 8, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !101
  %3 = load i8*, i8** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !102
  store i8 0, i8* %arrayidx, align 1, !dbg !103
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !104, metadata !DIExpression()), !dbg !106
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !106
  call void @llvm.dbg.declare(metadata i64* %i, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !109, metadata !DIExpression()), !dbg !110
  %5 = load i8*, i8** %data, align 8, !dbg !111
  %call = call i64 @strlen(i8* %5) #6, !dbg !112
  store i64 %call, i64* %dataLen, align 8, !dbg !113
  store i64 0, i64* %i, align 8, !dbg !114
  br label %for.cond, !dbg !116

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !117
  %7 = load i64, i64* %dataLen, align 8, !dbg !119
  %cmp = icmp ult i64 %6, %7, !dbg !120
  br i1 %cmp, label %for.body, label %for.end, !dbg !121

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !122
  %9 = load i64, i64* %i, align 8, !dbg !124
  %arrayidx1 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !122
  %10 = load i8, i8* %arrayidx1, align 1, !dbg !122
  %11 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !126
  store i8 %10, i8* %arrayidx2, align 1, !dbg !127
  br label %for.inc, !dbg !128

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !129
  %inc = add i64 %12, 1, !dbg !129
  store i64 %inc, i64* %i, align 8, !dbg !129
  br label %for.cond, !dbg !130, !llvm.loop !131

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !133
  store i8 0, i8* %arrayidx3, align 1, !dbg !134
  %13 = load i8*, i8** %data, align 8, !dbg !135
  call void @printLine(i8* %13), !dbg !136
  ret void, !dbg !137
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !138 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !141, metadata !DIExpression()), !dbg !142
  %0 = alloca i8, i64 100, align 16, !dbg !143
  store i8* %0, i8** %dataBuffer, align 8, !dbg !142
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !144
  store i8* %1, i8** %data, align 8, !dbg !145
  %2 = load i8*, i8** %data, align 8, !dbg !146
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !147
  %3 = load i8*, i8** %data, align 8, !dbg !148
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !148
  store i8 0, i8* %arrayidx, align 1, !dbg !149
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !150, metadata !DIExpression()), !dbg !152
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !152
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !152
  call void @llvm.dbg.declare(metadata i64* %i, metadata !153, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !155, metadata !DIExpression()), !dbg !156
  %5 = load i8*, i8** %data, align 8, !dbg !157
  %call = call i64 @strlen(i8* %5) #6, !dbg !158
  store i64 %call, i64* %dataLen, align 8, !dbg !159
  store i64 0, i64* %i, align 8, !dbg !160
  br label %for.cond, !dbg !162

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !163
  %7 = load i64, i64* %dataLen, align 8, !dbg !165
  %cmp = icmp ult i64 %6, %7, !dbg !166
  br i1 %cmp, label %for.body, label %for.end, !dbg !167

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !168
  %9 = load i64, i64* %i, align 8, !dbg !170
  %arrayidx1 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !168
  %10 = load i8, i8* %arrayidx1, align 1, !dbg !168
  %11 = load i64, i64* %i, align 8, !dbg !171
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !172
  store i8 %10, i8* %arrayidx2, align 1, !dbg !173
  br label %for.inc, !dbg !174

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !175
  %inc = add i64 %12, 1, !dbg !175
  store i64 %inc, i64* %i, align 8, !dbg !175
  br label %for.cond, !dbg !176, !llvm.loop !177

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !179
  store i8 0, i8* %arrayidx3, align 1, !dbg !180
  %13 = load i8*, i8** %data, align 8, !dbg !181
  call void @printLine(i8* %13), !dbg !182
  ret void, !dbg !183
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_15.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_15_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_15.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 10, scope: !13)
!24 = !DILocation(line: 32, column: 16, scope: !13)
!25 = !DILocation(line: 32, column: 9, scope: !13)
!26 = !DILocation(line: 33, column: 9, scope: !13)
!27 = !DILocation(line: 33, column: 21, scope: !13)
!28 = !DILocalVariable(name: "dest", scope: !29, file: !14, line: 41, type: !30)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 50)
!33 = !DILocation(line: 41, column: 14, scope: !29)
!34 = !DILocalVariable(name: "i", scope: !29, file: !14, line: 42, type: !35)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 46, baseType: !37)
!36 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!37 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 42, column: 16, scope: !29)
!39 = !DILocalVariable(name: "dataLen", scope: !29, file: !14, line: 42, type: !35)
!40 = !DILocation(line: 42, column: 19, scope: !29)
!41 = !DILocation(line: 43, column: 26, scope: !29)
!42 = !DILocation(line: 43, column: 19, scope: !29)
!43 = !DILocation(line: 43, column: 17, scope: !29)
!44 = !DILocation(line: 45, column: 16, scope: !45)
!45 = distinct !DILexicalBlock(scope: !29, file: !14, line: 45, column: 9)
!46 = !DILocation(line: 45, column: 14, scope: !45)
!47 = !DILocation(line: 45, column: 21, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !14, line: 45, column: 9)
!49 = !DILocation(line: 45, column: 25, scope: !48)
!50 = !DILocation(line: 45, column: 23, scope: !48)
!51 = !DILocation(line: 45, column: 9, scope: !45)
!52 = !DILocation(line: 47, column: 23, scope: !53)
!53 = distinct !DILexicalBlock(scope: !48, file: !14, line: 46, column: 9)
!54 = !DILocation(line: 47, column: 28, scope: !53)
!55 = !DILocation(line: 47, column: 18, scope: !53)
!56 = !DILocation(line: 47, column: 13, scope: !53)
!57 = !DILocation(line: 47, column: 21, scope: !53)
!58 = !DILocation(line: 48, column: 9, scope: !53)
!59 = !DILocation(line: 45, column: 35, scope: !48)
!60 = !DILocation(line: 45, column: 9, scope: !48)
!61 = distinct !{!61, !51, !62, !63}
!62 = !DILocation(line: 48, column: 9, scope: !45)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 49, column: 9, scope: !29)
!65 = !DILocation(line: 49, column: 20, scope: !29)
!66 = !DILocation(line: 50, column: 19, scope: !29)
!67 = !DILocation(line: 50, column: 9, scope: !29)
!68 = !DILocation(line: 52, column: 1, scope: !13)
!69 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_15_good", scope: !14, file: !14, line: 122, type: !15, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 124, column: 5, scope: !69)
!71 = !DILocation(line: 125, column: 5, scope: !69)
!72 = !DILocation(line: 126, column: 1, scope: !69)
!73 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 138, type: !74, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!76, !76, !77}
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !14, line: 138, type: !76)
!79 = !DILocation(line: 138, column: 14, scope: !73)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !14, line: 138, type: !77)
!81 = !DILocation(line: 138, column: 27, scope: !73)
!82 = !DILocation(line: 141, column: 22, scope: !73)
!83 = !DILocation(line: 141, column: 12, scope: !73)
!84 = !DILocation(line: 141, column: 5, scope: !73)
!85 = !DILocation(line: 143, column: 5, scope: !73)
!86 = !DILocation(line: 144, column: 5, scope: !73)
!87 = !DILocation(line: 145, column: 5, scope: !73)
!88 = !DILocation(line: 148, column: 5, scope: !73)
!89 = !DILocation(line: 149, column: 5, scope: !73)
!90 = !DILocation(line: 150, column: 5, scope: !73)
!91 = !DILocation(line: 152, column: 5, scope: !73)
!92 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 59, type: !15, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !14, line: 61, type: !4)
!94 = !DILocation(line: 61, column: 12, scope: !92)
!95 = !DILocalVariable(name: "dataBuffer", scope: !92, file: !14, line: 62, type: !4)
!96 = !DILocation(line: 62, column: 12, scope: !92)
!97 = !DILocation(line: 62, column: 33, scope: !92)
!98 = !DILocation(line: 63, column: 12, scope: !92)
!99 = !DILocation(line: 63, column: 10, scope: !92)
!100 = !DILocation(line: 72, column: 16, scope: !92)
!101 = !DILocation(line: 72, column: 9, scope: !92)
!102 = !DILocation(line: 73, column: 9, scope: !92)
!103 = !DILocation(line: 73, column: 20, scope: !92)
!104 = !DILocalVariable(name: "dest", scope: !105, file: !14, line: 77, type: !30)
!105 = distinct !DILexicalBlock(scope: !92, file: !14, line: 76, column: 5)
!106 = !DILocation(line: 77, column: 14, scope: !105)
!107 = !DILocalVariable(name: "i", scope: !105, file: !14, line: 78, type: !35)
!108 = !DILocation(line: 78, column: 16, scope: !105)
!109 = !DILocalVariable(name: "dataLen", scope: !105, file: !14, line: 78, type: !35)
!110 = !DILocation(line: 78, column: 19, scope: !105)
!111 = !DILocation(line: 79, column: 26, scope: !105)
!112 = !DILocation(line: 79, column: 19, scope: !105)
!113 = !DILocation(line: 79, column: 17, scope: !105)
!114 = !DILocation(line: 81, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !105, file: !14, line: 81, column: 9)
!116 = !DILocation(line: 81, column: 14, scope: !115)
!117 = !DILocation(line: 81, column: 21, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !14, line: 81, column: 9)
!119 = !DILocation(line: 81, column: 25, scope: !118)
!120 = !DILocation(line: 81, column: 23, scope: !118)
!121 = !DILocation(line: 81, column: 9, scope: !115)
!122 = !DILocation(line: 83, column: 23, scope: !123)
!123 = distinct !DILexicalBlock(scope: !118, file: !14, line: 82, column: 9)
!124 = !DILocation(line: 83, column: 28, scope: !123)
!125 = !DILocation(line: 83, column: 18, scope: !123)
!126 = !DILocation(line: 83, column: 13, scope: !123)
!127 = !DILocation(line: 83, column: 21, scope: !123)
!128 = !DILocation(line: 84, column: 9, scope: !123)
!129 = !DILocation(line: 81, column: 35, scope: !118)
!130 = !DILocation(line: 81, column: 9, scope: !118)
!131 = distinct !{!131, !121, !132, !63}
!132 = !DILocation(line: 84, column: 9, scope: !115)
!133 = !DILocation(line: 85, column: 9, scope: !105)
!134 = !DILocation(line: 85, column: 20, scope: !105)
!135 = !DILocation(line: 86, column: 19, scope: !105)
!136 = !DILocation(line: 86, column: 9, scope: !105)
!137 = !DILocation(line: 88, column: 1, scope: !92)
!138 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 91, type: !15, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!139 = !DILocalVariable(name: "data", scope: !138, file: !14, line: 93, type: !4)
!140 = !DILocation(line: 93, column: 12, scope: !138)
!141 = !DILocalVariable(name: "dataBuffer", scope: !138, file: !14, line: 94, type: !4)
!142 = !DILocation(line: 94, column: 12, scope: !138)
!143 = !DILocation(line: 94, column: 33, scope: !138)
!144 = !DILocation(line: 95, column: 12, scope: !138)
!145 = !DILocation(line: 95, column: 10, scope: !138)
!146 = !DILocation(line: 100, column: 16, scope: !138)
!147 = !DILocation(line: 100, column: 9, scope: !138)
!148 = !DILocation(line: 101, column: 9, scope: !138)
!149 = !DILocation(line: 101, column: 20, scope: !138)
!150 = !DILocalVariable(name: "dest", scope: !151, file: !14, line: 109, type: !30)
!151 = distinct !DILexicalBlock(scope: !138, file: !14, line: 108, column: 5)
!152 = !DILocation(line: 109, column: 14, scope: !151)
!153 = !DILocalVariable(name: "i", scope: !151, file: !14, line: 110, type: !35)
!154 = !DILocation(line: 110, column: 16, scope: !151)
!155 = !DILocalVariable(name: "dataLen", scope: !151, file: !14, line: 110, type: !35)
!156 = !DILocation(line: 110, column: 19, scope: !151)
!157 = !DILocation(line: 111, column: 26, scope: !151)
!158 = !DILocation(line: 111, column: 19, scope: !151)
!159 = !DILocation(line: 111, column: 17, scope: !151)
!160 = !DILocation(line: 113, column: 16, scope: !161)
!161 = distinct !DILexicalBlock(scope: !151, file: !14, line: 113, column: 9)
!162 = !DILocation(line: 113, column: 14, scope: !161)
!163 = !DILocation(line: 113, column: 21, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !14, line: 113, column: 9)
!165 = !DILocation(line: 113, column: 25, scope: !164)
!166 = !DILocation(line: 113, column: 23, scope: !164)
!167 = !DILocation(line: 113, column: 9, scope: !161)
!168 = !DILocation(line: 115, column: 23, scope: !169)
!169 = distinct !DILexicalBlock(scope: !164, file: !14, line: 114, column: 9)
!170 = !DILocation(line: 115, column: 28, scope: !169)
!171 = !DILocation(line: 115, column: 18, scope: !169)
!172 = !DILocation(line: 115, column: 13, scope: !169)
!173 = !DILocation(line: 115, column: 21, scope: !169)
!174 = !DILocation(line: 116, column: 9, scope: !169)
!175 = !DILocation(line: 113, column: 35, scope: !164)
!176 = !DILocation(line: 113, column: 9, scope: !164)
!177 = distinct !{!177, !167, !178, !63}
!178 = !DILocation(line: 116, column: 9, scope: !161)
!179 = !DILocation(line: 117, column: 9, scope: !151)
!180 = !DILocation(line: 117, column: 20, scope: !151)
!181 = !DILocation(line: 118, column: 19, scope: !151)
!182 = !DILocation(line: 118, column: 9, scope: !151)
!183 = !DILocation(line: 120, column: 1, scope: !138)
