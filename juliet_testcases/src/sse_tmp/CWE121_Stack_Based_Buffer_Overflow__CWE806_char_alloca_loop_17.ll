; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_17_bad() #0 !dbg !13 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i1 = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !17, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = alloca i8, i64 100, align 16, !dbg !24
  store i8* %0, i8** %dataBuffer, align 8, !dbg !23
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !25
  store i8* %1, i8** %data, align 8, !dbg !26
  store i32 0, i32* %i, align 4, !dbg !27
  br label %for.cond, !dbg !29

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4, !dbg !30
  %cmp = icmp slt i32 %2, 1, !dbg !32
  br i1 %cmp, label %for.body, label %for.end, !dbg !33

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 99, i1 false), !dbg !36
  %4 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  br label %for.inc, !dbg !39

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !40
  %inc = add nsw i32 %5, 1, !dbg !40
  store i32 %inc, i32* %i, align 4, !dbg !40
  br label %for.cond, !dbg !41, !llvm.loop !42

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !45, metadata !DIExpression()), !dbg !50
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !51, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !56, metadata !DIExpression()), !dbg !57
  %7 = load i8*, i8** %data, align 8, !dbg !58
  %call = call i64 @strlen(i8* %7) #6, !dbg !59
  store i64 %call, i64* %dataLen, align 8, !dbg !60
  store i64 0, i64* %i1, align 8, !dbg !61
  br label %for.cond2, !dbg !63

for.cond2:                                        ; preds = %for.inc7, %for.end
  %8 = load i64, i64* %i1, align 8, !dbg !64
  %9 = load i64, i64* %dataLen, align 8, !dbg !66
  %cmp3 = icmp ult i64 %8, %9, !dbg !67
  br i1 %cmp3, label %for.body4, label %for.end9, !dbg !68

for.body4:                                        ; preds = %for.cond2
  %10 = load i8*, i8** %data, align 8, !dbg !69
  %11 = load i64, i64* %i1, align 8, !dbg !71
  %arrayidx5 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !69
  %12 = load i8, i8* %arrayidx5, align 1, !dbg !69
  %13 = load i64, i64* %i1, align 8, !dbg !72
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %13, !dbg !73
  store i8 %12, i8* %arrayidx6, align 1, !dbg !74
  br label %for.inc7, !dbg !75

for.inc7:                                         ; preds = %for.body4
  %14 = load i64, i64* %i1, align 8, !dbg !76
  %inc8 = add i64 %14, 1, !dbg !76
  store i64 %inc8, i64* %i1, align 8, !dbg !76
  br label %for.cond2, !dbg !77, !llvm.loop !78

for.end9:                                         ; preds = %for.cond2
  %arrayidx10 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !80
  store i8 0, i8* %arrayidx10, align 1, !dbg !81
  %15 = load i8*, i8** %data, align 8, !dbg !82
  call void @printLine(i8* %15), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_17_good() #0 !dbg !85 {
entry:
  call void @goodG2B(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* null) #7, !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 %conv) #7, !dbg !98
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_17_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_17_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !106 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i8** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %0 = alloca i8, i64 100, align 16, !dbg !113
  store i8* %0, i8** %dataBuffer, align 8, !dbg !112
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !114
  store i8* %1, i8** %data, align 8, !dbg !115
  store i32 0, i32* %h, align 4, !dbg !116
  br label %for.cond, !dbg !118

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %h, align 4, !dbg !119
  %cmp = icmp slt i32 %2, 1, !dbg !121
  br i1 %cmp, label %for.body, label %for.end, !dbg !122

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !125
  %4 = load i8*, i8** %data, align 8, !dbg !126
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !126
  store i8 0, i8* %arrayidx, align 1, !dbg !127
  br label %for.inc, !dbg !128

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %h, align 4, !dbg !129
  %inc = add nsw i32 %5, 1, !dbg !129
  store i32 %inc, i32* %h, align 4, !dbg !129
  br label %for.cond, !dbg !130, !llvm.loop !131

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !133, metadata !DIExpression()), !dbg !135
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !135
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !135
  call void @llvm.dbg.declare(metadata i64* %i, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !138, metadata !DIExpression()), !dbg !139
  %7 = load i8*, i8** %data, align 8, !dbg !140
  %call = call i64 @strlen(i8* %7) #6, !dbg !141
  store i64 %call, i64* %dataLen, align 8, !dbg !142
  store i64 0, i64* %i, align 8, !dbg !143
  br label %for.cond1, !dbg !145

for.cond1:                                        ; preds = %for.inc6, %for.end
  %8 = load i64, i64* %i, align 8, !dbg !146
  %9 = load i64, i64* %dataLen, align 8, !dbg !148
  %cmp2 = icmp ult i64 %8, %9, !dbg !149
  br i1 %cmp2, label %for.body3, label %for.end8, !dbg !150

for.body3:                                        ; preds = %for.cond1
  %10 = load i8*, i8** %data, align 8, !dbg !151
  %11 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx4 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !151
  %12 = load i8, i8* %arrayidx4, align 1, !dbg !151
  %13 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %13, !dbg !155
  store i8 %12, i8* %arrayidx5, align 1, !dbg !156
  br label %for.inc6, !dbg !157

for.inc6:                                         ; preds = %for.body3
  %14 = load i64, i64* %i, align 8, !dbg !158
  %inc7 = add i64 %14, 1, !dbg !158
  store i64 %inc7, i64* %i, align 8, !dbg !158
  br label %for.cond1, !dbg !159, !llvm.loop !160

for.end8:                                         ; preds = %for.cond1
  %arrayidx9 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !162
  store i8 0, i8* %arrayidx9, align 1, !dbg !163
  %15 = load i8*, i8** %data, align 8, !dbg !164
  call void @printLine(i8* %15), !dbg !165
  ret void, !dbg !166
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_17_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "i", scope: !13, file: !14, line: 25, type: !18)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocation(line: 25, column: 9, scope: !13)
!20 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 26, type: !4)
!21 = !DILocation(line: 26, column: 12, scope: !13)
!22 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 27, type: !4)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 33, scope: !13)
!25 = !DILocation(line: 28, column: 12, scope: !13)
!26 = !DILocation(line: 28, column: 10, scope: !13)
!27 = !DILocation(line: 29, column: 11, scope: !28)
!28 = distinct !DILexicalBlock(scope: !13, file: !14, line: 29, column: 5)
!29 = !DILocation(line: 29, column: 9, scope: !28)
!30 = !DILocation(line: 29, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !14, line: 29, column: 5)
!32 = !DILocation(line: 29, column: 18, scope: !31)
!33 = !DILocation(line: 29, column: 5, scope: !28)
!34 = !DILocation(line: 32, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !14, line: 30, column: 5)
!36 = !DILocation(line: 32, column: 9, scope: !35)
!37 = !DILocation(line: 33, column: 9, scope: !35)
!38 = !DILocation(line: 33, column: 21, scope: !35)
!39 = !DILocation(line: 34, column: 5, scope: !35)
!40 = !DILocation(line: 29, column: 24, scope: !31)
!41 = !DILocation(line: 29, column: 5, scope: !31)
!42 = distinct !{!42, !33, !43, !44}
!43 = !DILocation(line: 34, column: 5, scope: !28)
!44 = !{!"llvm.loop.mustprogress"}
!45 = !DILocalVariable(name: "dest", scope: !46, file: !14, line: 36, type: !47)
!46 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 50)
!50 = !DILocation(line: 36, column: 14, scope: !46)
!51 = !DILocalVariable(name: "i", scope: !46, file: !14, line: 37, type: !52)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !53, line: 46, baseType: !54)
!53 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!54 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 37, column: 16, scope: !46)
!56 = !DILocalVariable(name: "dataLen", scope: !46, file: !14, line: 37, type: !52)
!57 = !DILocation(line: 37, column: 19, scope: !46)
!58 = !DILocation(line: 38, column: 26, scope: !46)
!59 = !DILocation(line: 38, column: 19, scope: !46)
!60 = !DILocation(line: 38, column: 17, scope: !46)
!61 = !DILocation(line: 40, column: 16, scope: !62)
!62 = distinct !DILexicalBlock(scope: !46, file: !14, line: 40, column: 9)
!63 = !DILocation(line: 40, column: 14, scope: !62)
!64 = !DILocation(line: 40, column: 21, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !14, line: 40, column: 9)
!66 = !DILocation(line: 40, column: 25, scope: !65)
!67 = !DILocation(line: 40, column: 23, scope: !65)
!68 = !DILocation(line: 40, column: 9, scope: !62)
!69 = !DILocation(line: 42, column: 23, scope: !70)
!70 = distinct !DILexicalBlock(scope: !65, file: !14, line: 41, column: 9)
!71 = !DILocation(line: 42, column: 28, scope: !70)
!72 = !DILocation(line: 42, column: 18, scope: !70)
!73 = !DILocation(line: 42, column: 13, scope: !70)
!74 = !DILocation(line: 42, column: 21, scope: !70)
!75 = !DILocation(line: 43, column: 9, scope: !70)
!76 = !DILocation(line: 40, column: 35, scope: !65)
!77 = !DILocation(line: 40, column: 9, scope: !65)
!78 = distinct !{!78, !68, !79, !44}
!79 = !DILocation(line: 43, column: 9, scope: !62)
!80 = !DILocation(line: 44, column: 9, scope: !46)
!81 = !DILocation(line: 44, column: 20, scope: !46)
!82 = !DILocation(line: 45, column: 19, scope: !46)
!83 = !DILocation(line: 45, column: 9, scope: !46)
!84 = !DILocation(line: 47, column: 1, scope: !13)
!85 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_17_good", scope: !14, file: !14, line: 80, type: !15, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 82, column: 5, scope: !85)
!87 = !DILocation(line: 83, column: 1, scope: !85)
!88 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 95, type: !89, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!18, !18, !91}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !14, line: 95, type: !18)
!93 = !DILocation(line: 95, column: 14, scope: !88)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !14, line: 95, type: !91)
!95 = !DILocation(line: 95, column: 27, scope: !88)
!96 = !DILocation(line: 98, column: 22, scope: !88)
!97 = !DILocation(line: 98, column: 12, scope: !88)
!98 = !DILocation(line: 98, column: 5, scope: !88)
!99 = !DILocation(line: 100, column: 5, scope: !88)
!100 = !DILocation(line: 101, column: 5, scope: !88)
!101 = !DILocation(line: 102, column: 5, scope: !88)
!102 = !DILocation(line: 105, column: 5, scope: !88)
!103 = !DILocation(line: 106, column: 5, scope: !88)
!104 = !DILocation(line: 107, column: 5, scope: !88)
!105 = !DILocation(line: 109, column: 5, scope: !88)
!106 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 54, type: !15, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "h", scope: !106, file: !14, line: 56, type: !18)
!108 = !DILocation(line: 56, column: 9, scope: !106)
!109 = !DILocalVariable(name: "data", scope: !106, file: !14, line: 57, type: !4)
!110 = !DILocation(line: 57, column: 12, scope: !106)
!111 = !DILocalVariable(name: "dataBuffer", scope: !106, file: !14, line: 58, type: !4)
!112 = !DILocation(line: 58, column: 12, scope: !106)
!113 = !DILocation(line: 58, column: 33, scope: !106)
!114 = !DILocation(line: 59, column: 12, scope: !106)
!115 = !DILocation(line: 59, column: 10, scope: !106)
!116 = !DILocation(line: 60, column: 11, scope: !117)
!117 = distinct !DILexicalBlock(scope: !106, file: !14, line: 60, column: 5)
!118 = !DILocation(line: 60, column: 9, scope: !117)
!119 = !DILocation(line: 60, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !14, line: 60, column: 5)
!121 = !DILocation(line: 60, column: 18, scope: !120)
!122 = !DILocation(line: 60, column: 5, scope: !117)
!123 = !DILocation(line: 63, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !14, line: 61, column: 5)
!125 = !DILocation(line: 63, column: 9, scope: !124)
!126 = !DILocation(line: 64, column: 9, scope: !124)
!127 = !DILocation(line: 64, column: 20, scope: !124)
!128 = !DILocation(line: 65, column: 5, scope: !124)
!129 = !DILocation(line: 60, column: 24, scope: !120)
!130 = !DILocation(line: 60, column: 5, scope: !120)
!131 = distinct !{!131, !122, !132, !44}
!132 = !DILocation(line: 65, column: 5, scope: !117)
!133 = !DILocalVariable(name: "dest", scope: !134, file: !14, line: 67, type: !47)
!134 = distinct !DILexicalBlock(scope: !106, file: !14, line: 66, column: 5)
!135 = !DILocation(line: 67, column: 14, scope: !134)
!136 = !DILocalVariable(name: "i", scope: !134, file: !14, line: 68, type: !52)
!137 = !DILocation(line: 68, column: 16, scope: !134)
!138 = !DILocalVariable(name: "dataLen", scope: !134, file: !14, line: 68, type: !52)
!139 = !DILocation(line: 68, column: 19, scope: !134)
!140 = !DILocation(line: 69, column: 26, scope: !134)
!141 = !DILocation(line: 69, column: 19, scope: !134)
!142 = !DILocation(line: 69, column: 17, scope: !134)
!143 = !DILocation(line: 71, column: 16, scope: !144)
!144 = distinct !DILexicalBlock(scope: !134, file: !14, line: 71, column: 9)
!145 = !DILocation(line: 71, column: 14, scope: !144)
!146 = !DILocation(line: 71, column: 21, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !14, line: 71, column: 9)
!148 = !DILocation(line: 71, column: 25, scope: !147)
!149 = !DILocation(line: 71, column: 23, scope: !147)
!150 = !DILocation(line: 71, column: 9, scope: !144)
!151 = !DILocation(line: 73, column: 23, scope: !152)
!152 = distinct !DILexicalBlock(scope: !147, file: !14, line: 72, column: 9)
!153 = !DILocation(line: 73, column: 28, scope: !152)
!154 = !DILocation(line: 73, column: 18, scope: !152)
!155 = !DILocation(line: 73, column: 13, scope: !152)
!156 = !DILocation(line: 73, column: 21, scope: !152)
!157 = !DILocation(line: 74, column: 9, scope: !152)
!158 = !DILocation(line: 71, column: 35, scope: !147)
!159 = !DILocation(line: 71, column: 9, scope: !147)
!160 = distinct !{!160, !150, !161, !44}
!161 = !DILocation(line: 74, column: 9, scope: !144)
!162 = !DILocation(line: 75, column: 9, scope: !134)
!163 = !DILocation(line: 75, column: 20, scope: !134)
!164 = !DILocation(line: 76, column: 19, scope: !134)
!165 = !DILocation(line: 76, column: 9, scope: !134)
!166 = !DILocation(line: 78, column: 1, scope: !106)
