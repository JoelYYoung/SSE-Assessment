; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i1 = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !22, metadata !DIExpression()), !dbg !26
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !27
  store i8* %arraydecay, i8** %data, align 8, !dbg !28
  store i32 0, i32* %i, align 4, !dbg !29
  br label %for.cond, !dbg !31

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !32
  %cmp = icmp slt i32 %0, 1, !dbg !34
  br i1 %cmp, label %for.body, label %for.end, !dbg !35

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** %data, align 8, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !38
  %2 = load i8*, i8** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !39
  store i8 0, i8* %arrayidx, align 1, !dbg !40
  br label %for.inc, !dbg !41

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4, !dbg !42
  %inc = add nsw i32 %3, 1, !dbg !42
  store i32 %inc, i32* %i, align 4, !dbg !42
  br label %for.cond, !dbg !43, !llvm.loop !44

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !47, metadata !DIExpression()), !dbg !52
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !53, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !58, metadata !DIExpression()), !dbg !59
  %5 = load i8*, i8** %data, align 8, !dbg !60
  %call = call i64 @strlen(i8* %5) #6, !dbg !61
  store i64 %call, i64* %dataLen, align 8, !dbg !62
  store i64 0, i64* %i1, align 8, !dbg !63
  br label %for.cond2, !dbg !65

for.cond2:                                        ; preds = %for.inc7, %for.end
  %6 = load i64, i64* %i1, align 8, !dbg !66
  %7 = load i64, i64* %dataLen, align 8, !dbg !68
  %cmp3 = icmp ult i64 %6, %7, !dbg !69
  br i1 %cmp3, label %for.body4, label %for.end9, !dbg !70

for.body4:                                        ; preds = %for.cond2
  %8 = load i8*, i8** %data, align 8, !dbg !71
  %9 = load i64, i64* %i1, align 8, !dbg !73
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !71
  %10 = load i8, i8* %arrayidx5, align 1, !dbg !71
  %11 = load i64, i64* %i1, align 8, !dbg !74
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !75
  store i8 %10, i8* %arrayidx6, align 1, !dbg !76
  br label %for.inc7, !dbg !77

for.inc7:                                         ; preds = %for.body4
  %12 = load i64, i64* %i1, align 8, !dbg !78
  %inc8 = add i64 %12, 1, !dbg !78
  store i64 %inc8, i64* %i1, align 8, !dbg !78
  br label %for.cond2, !dbg !79, !llvm.loop !80

for.end9:                                         ; preds = %for.cond2
  %arrayidx10 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !82
  store i8 0, i8* %arrayidx10, align 1, !dbg !83
  %13 = load i8*, i8** %data, align 8, !dbg !84
  call void @printLine(i8* %13), !dbg !85
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_17_good() #0 !dbg !87 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_17_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_17_bad(), !dbg !105
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
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i8** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !115
  store i8* %arraydecay, i8** %data, align 8, !dbg !116
  store i32 0, i32* %h, align 4, !dbg !117
  br label %for.cond, !dbg !119

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !120
  %cmp = icmp slt i32 %0, 1, !dbg !122
  br i1 %cmp, label %for.body, label %for.end, !dbg !123

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** %data, align 8, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !126
  %2 = load i8*, i8** %data, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !127
  store i8 0, i8* %arrayidx, align 1, !dbg !128
  br label %for.inc, !dbg !129

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %h, align 4, !dbg !130
  %inc = add nsw i32 %3, 1, !dbg !130
  store i32 %inc, i32* %h, align 4, !dbg !130
  br label %for.cond, !dbg !131, !llvm.loop !132

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !134, metadata !DIExpression()), !dbg !136
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !136
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !136
  call void @llvm.dbg.declare(metadata i64* %i, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !139, metadata !DIExpression()), !dbg !140
  %5 = load i8*, i8** %data, align 8, !dbg !141
  %call = call i64 @strlen(i8* %5) #6, !dbg !142
  store i64 %call, i64* %dataLen, align 8, !dbg !143
  store i64 0, i64* %i, align 8, !dbg !144
  br label %for.cond1, !dbg !146

for.cond1:                                        ; preds = %for.inc6, %for.end
  %6 = load i64, i64* %i, align 8, !dbg !147
  %7 = load i64, i64* %dataLen, align 8, !dbg !149
  %cmp2 = icmp ult i64 %6, %7, !dbg !150
  br i1 %cmp2, label %for.body3, label %for.end8, !dbg !151

for.body3:                                        ; preds = %for.cond1
  %8 = load i8*, i8** %data, align 8, !dbg !152
  %9 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx4 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !152
  %10 = load i8, i8* %arrayidx4, align 1, !dbg !152
  %11 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !156
  store i8 %10, i8* %arrayidx5, align 1, !dbg !157
  br label %for.inc6, !dbg !158

for.inc6:                                         ; preds = %for.body3
  %12 = load i64, i64* %i, align 8, !dbg !159
  %inc7 = add i64 %12, 1, !dbg !159
  store i64 %inc7, i64* %i, align 8, !dbg !159
  br label %for.cond1, !dbg !160, !llvm.loop !161

for.end8:                                         ; preds = %for.cond1
  %arrayidx9 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !163
  store i8 0, i8* %arrayidx9, align 1, !dbg !164
  %13 = load i8*, i8** %data, align 8, !dbg !165
  call void @printLine(i8* %13), !dbg !166
  ret void, !dbg !167
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
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_17_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 25, column: 9, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 26, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!21 = !DILocation(line: 26, column: 12, scope: !11)
!22 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 27, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 800, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 27, column: 10, scope: !11)
!27 = !DILocation(line: 28, column: 12, scope: !11)
!28 = !DILocation(line: 28, column: 10, scope: !11)
!29 = !DILocation(line: 29, column: 11, scope: !30)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!31 = !DILocation(line: 29, column: 9, scope: !30)
!32 = !DILocation(line: 29, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !12, line: 29, column: 5)
!34 = !DILocation(line: 29, column: 18, scope: !33)
!35 = !DILocation(line: 29, column: 5, scope: !30)
!36 = !DILocation(line: 32, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !12, line: 30, column: 5)
!38 = !DILocation(line: 32, column: 9, scope: !37)
!39 = !DILocation(line: 33, column: 9, scope: !37)
!40 = !DILocation(line: 33, column: 21, scope: !37)
!41 = !DILocation(line: 34, column: 5, scope: !37)
!42 = !DILocation(line: 29, column: 24, scope: !33)
!43 = !DILocation(line: 29, column: 5, scope: !33)
!44 = distinct !{!44, !35, !45, !46}
!45 = !DILocation(line: 34, column: 5, scope: !30)
!46 = !{!"llvm.loop.mustprogress"}
!47 = !DILocalVariable(name: "dest", scope: !48, file: !12, line: 36, type: !49)
!48 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 400, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 50)
!52 = !DILocation(line: 36, column: 14, scope: !48)
!53 = !DILocalVariable(name: "i", scope: !48, file: !12, line: 37, type: !54)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !55, line: 46, baseType: !56)
!55 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!56 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!57 = !DILocation(line: 37, column: 16, scope: !48)
!58 = !DILocalVariable(name: "dataLen", scope: !48, file: !12, line: 37, type: !54)
!59 = !DILocation(line: 37, column: 19, scope: !48)
!60 = !DILocation(line: 38, column: 26, scope: !48)
!61 = !DILocation(line: 38, column: 19, scope: !48)
!62 = !DILocation(line: 38, column: 17, scope: !48)
!63 = !DILocation(line: 40, column: 16, scope: !64)
!64 = distinct !DILexicalBlock(scope: !48, file: !12, line: 40, column: 9)
!65 = !DILocation(line: 40, column: 14, scope: !64)
!66 = !DILocation(line: 40, column: 21, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !12, line: 40, column: 9)
!68 = !DILocation(line: 40, column: 25, scope: !67)
!69 = !DILocation(line: 40, column: 23, scope: !67)
!70 = !DILocation(line: 40, column: 9, scope: !64)
!71 = !DILocation(line: 42, column: 23, scope: !72)
!72 = distinct !DILexicalBlock(scope: !67, file: !12, line: 41, column: 9)
!73 = !DILocation(line: 42, column: 28, scope: !72)
!74 = !DILocation(line: 42, column: 18, scope: !72)
!75 = !DILocation(line: 42, column: 13, scope: !72)
!76 = !DILocation(line: 42, column: 21, scope: !72)
!77 = !DILocation(line: 43, column: 9, scope: !72)
!78 = !DILocation(line: 40, column: 35, scope: !67)
!79 = !DILocation(line: 40, column: 9, scope: !67)
!80 = distinct !{!80, !70, !81, !46}
!81 = !DILocation(line: 43, column: 9, scope: !64)
!82 = !DILocation(line: 44, column: 9, scope: !48)
!83 = !DILocation(line: 44, column: 20, scope: !48)
!84 = !DILocation(line: 45, column: 19, scope: !48)
!85 = !DILocation(line: 45, column: 9, scope: !48)
!86 = !DILocation(line: 47, column: 1, scope: !11)
!87 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_17_good", scope: !12, file: !12, line: 80, type: !13, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocation(line: 82, column: 5, scope: !87)
!89 = !DILocation(line: 83, column: 1, scope: !87)
!90 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 95, type: !91, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DISubroutineType(types: !92)
!92 = !{!16, !16, !93}
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !12, line: 95, type: !16)
!95 = !DILocation(line: 95, column: 14, scope: !90)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !12, line: 95, type: !93)
!97 = !DILocation(line: 95, column: 27, scope: !90)
!98 = !DILocation(line: 98, column: 22, scope: !90)
!99 = !DILocation(line: 98, column: 12, scope: !90)
!100 = !DILocation(line: 98, column: 5, scope: !90)
!101 = !DILocation(line: 100, column: 5, scope: !90)
!102 = !DILocation(line: 101, column: 5, scope: !90)
!103 = !DILocation(line: 102, column: 5, scope: !90)
!104 = !DILocation(line: 105, column: 5, scope: !90)
!105 = !DILocation(line: 106, column: 5, scope: !90)
!106 = !DILocation(line: 107, column: 5, scope: !90)
!107 = !DILocation(line: 109, column: 5, scope: !90)
!108 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "h", scope: !108, file: !12, line: 56, type: !16)
!110 = !DILocation(line: 56, column: 9, scope: !108)
!111 = !DILocalVariable(name: "data", scope: !108, file: !12, line: 57, type: !19)
!112 = !DILocation(line: 57, column: 12, scope: !108)
!113 = !DILocalVariable(name: "dataBuffer", scope: !108, file: !12, line: 58, type: !23)
!114 = !DILocation(line: 58, column: 10, scope: !108)
!115 = !DILocation(line: 59, column: 12, scope: !108)
!116 = !DILocation(line: 59, column: 10, scope: !108)
!117 = !DILocation(line: 60, column: 11, scope: !118)
!118 = distinct !DILexicalBlock(scope: !108, file: !12, line: 60, column: 5)
!119 = !DILocation(line: 60, column: 9, scope: !118)
!120 = !DILocation(line: 60, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !12, line: 60, column: 5)
!122 = !DILocation(line: 60, column: 18, scope: !121)
!123 = !DILocation(line: 60, column: 5, scope: !118)
!124 = !DILocation(line: 63, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !12, line: 61, column: 5)
!126 = !DILocation(line: 63, column: 9, scope: !125)
!127 = !DILocation(line: 64, column: 9, scope: !125)
!128 = !DILocation(line: 64, column: 20, scope: !125)
!129 = !DILocation(line: 65, column: 5, scope: !125)
!130 = !DILocation(line: 60, column: 24, scope: !121)
!131 = !DILocation(line: 60, column: 5, scope: !121)
!132 = distinct !{!132, !123, !133, !46}
!133 = !DILocation(line: 65, column: 5, scope: !118)
!134 = !DILocalVariable(name: "dest", scope: !135, file: !12, line: 67, type: !49)
!135 = distinct !DILexicalBlock(scope: !108, file: !12, line: 66, column: 5)
!136 = !DILocation(line: 67, column: 14, scope: !135)
!137 = !DILocalVariable(name: "i", scope: !135, file: !12, line: 68, type: !54)
!138 = !DILocation(line: 68, column: 16, scope: !135)
!139 = !DILocalVariable(name: "dataLen", scope: !135, file: !12, line: 68, type: !54)
!140 = !DILocation(line: 68, column: 19, scope: !135)
!141 = !DILocation(line: 69, column: 26, scope: !135)
!142 = !DILocation(line: 69, column: 19, scope: !135)
!143 = !DILocation(line: 69, column: 17, scope: !135)
!144 = !DILocation(line: 71, column: 16, scope: !145)
!145 = distinct !DILexicalBlock(scope: !135, file: !12, line: 71, column: 9)
!146 = !DILocation(line: 71, column: 14, scope: !145)
!147 = !DILocation(line: 71, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !12, line: 71, column: 9)
!149 = !DILocation(line: 71, column: 25, scope: !148)
!150 = !DILocation(line: 71, column: 23, scope: !148)
!151 = !DILocation(line: 71, column: 9, scope: !145)
!152 = !DILocation(line: 73, column: 23, scope: !153)
!153 = distinct !DILexicalBlock(scope: !148, file: !12, line: 72, column: 9)
!154 = !DILocation(line: 73, column: 28, scope: !153)
!155 = !DILocation(line: 73, column: 18, scope: !153)
!156 = !DILocation(line: 73, column: 13, scope: !153)
!157 = !DILocation(line: 73, column: 21, scope: !153)
!158 = !DILocation(line: 74, column: 9, scope: !153)
!159 = !DILocation(line: 71, column: 35, scope: !148)
!160 = !DILocation(line: 71, column: 9, scope: !148)
!161 = distinct !{!161, !151, !162, !46}
!162 = !DILocation(line: 74, column: 9, scope: !145)
!163 = !DILocation(line: 75, column: 9, scope: !135)
!164 = !DILocation(line: 75, column: 20, scope: !135)
!165 = !DILocation(line: 76, column: 19, scope: !135)
!166 = !DILocation(line: 76, column: 9, scope: !135)
!167 = !DILocation(line: 78, column: 1, scope: !108)
