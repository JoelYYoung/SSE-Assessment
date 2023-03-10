; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_61a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  store i8* %arraydecay, i8** %data, align 8, !dbg !25
  %0 = load i8*, i8** %data, align 8, !dbg !26
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_61b_badSource(i8* %0), !dbg !27
  store i8* %call, i8** %data, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !29, metadata !DIExpression()), !dbg !34
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !40, metadata !DIExpression()), !dbg !41
  %2 = load i8*, i8** %data, align 8, !dbg !42
  %call1 = call i64 @strlen(i8* %2) #6, !dbg !43
  store i64 %call1, i64* %dataLen, align 8, !dbg !44
  store i64 0, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !48
  %4 = load i64, i64* %dataLen, align 8, !dbg !50
  %cmp = icmp ult i64 %3, %4, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !53
  %6 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !53
  %7 = load i8, i8* %arrayidx, align 1, !dbg !53
  %8 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !57
  store i8 %7, i8* %arrayidx2, align 1, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %9, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !65
  store i8 0, i8* %arrayidx3, align 1, !dbg !66
  %10 = load i8*, i8** %data, align 8, !dbg !67
  call void @printLine(i8* %10), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_61b_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_61_good() #0 !dbg !70 {
entry:
  call void @goodG2B(), !dbg !71
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_61_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_61_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !92 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !97
  store i8* %arraydecay, i8** %data, align 8, !dbg !98
  %0 = load i8*, i8** %data, align 8, !dbg !99
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_61b_goodG2BSource(i8* %0), !dbg !100
  store i8* %call, i8** %data, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !102, metadata !DIExpression()), !dbg !104
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !104
  call void @llvm.dbg.declare(metadata i64* %i, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !107, metadata !DIExpression()), !dbg !108
  %2 = load i8*, i8** %data, align 8, !dbg !109
  %call1 = call i64 @strlen(i8* %2) #6, !dbg !110
  store i64 %call1, i64* %dataLen, align 8, !dbg !111
  store i64 0, i64* %i, align 8, !dbg !112
  br label %for.cond, !dbg !114

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !115
  %4 = load i64, i64* %dataLen, align 8, !dbg !117
  %cmp = icmp ult i64 %3, %4, !dbg !118
  br i1 %cmp, label %for.body, label %for.end, !dbg !119

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !120
  %6 = load i64, i64* %i, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !120
  %7 = load i8, i8* %arrayidx, align 1, !dbg !120
  %8 = load i64, i64* %i, align 8, !dbg !123
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !124
  store i8 %7, i8* %arrayidx2, align 1, !dbg !125
  br label %for.inc, !dbg !126

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !127
  %inc = add i64 %9, 1, !dbg !127
  store i64 %inc, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !128, !llvm.loop !129

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !131
  store i8 0, i8* %arrayidx3, align 1, !dbg !132
  %10 = load i8*, i8** %data, align 8, !dbg !133
  call void @printLine(i8* %10), !dbg !134
  ret void, !dbg !135
}

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_61b_goodG2BSource(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_61_bad", scope: !12, file: !12, line: 26, type: !13, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 28, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 28, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 29, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 29, column: 10, scope: !11)
!24 = !DILocation(line: 30, column: 12, scope: !11)
!25 = !DILocation(line: 30, column: 10, scope: !11)
!26 = !DILocation(line: 31, column: 87, scope: !11)
!27 = !DILocation(line: 31, column: 12, scope: !11)
!28 = !DILocation(line: 31, column: 10, scope: !11)
!29 = !DILocalVariable(name: "dest", scope: !30, file: !12, line: 33, type: !31)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 50)
!34 = !DILocation(line: 33, column: 14, scope: !30)
!35 = !DILocalVariable(name: "i", scope: !30, file: !12, line: 34, type: !36)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !37, line: 46, baseType: !38)
!37 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!38 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 34, column: 16, scope: !30)
!40 = !DILocalVariable(name: "dataLen", scope: !30, file: !12, line: 34, type: !36)
!41 = !DILocation(line: 34, column: 19, scope: !30)
!42 = !DILocation(line: 35, column: 26, scope: !30)
!43 = !DILocation(line: 35, column: 19, scope: !30)
!44 = !DILocation(line: 35, column: 17, scope: !30)
!45 = !DILocation(line: 37, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !30, file: !12, line: 37, column: 9)
!47 = !DILocation(line: 37, column: 14, scope: !46)
!48 = !DILocation(line: 37, column: 21, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !12, line: 37, column: 9)
!50 = !DILocation(line: 37, column: 25, scope: !49)
!51 = !DILocation(line: 37, column: 23, scope: !49)
!52 = !DILocation(line: 37, column: 9, scope: !46)
!53 = !DILocation(line: 39, column: 23, scope: !54)
!54 = distinct !DILexicalBlock(scope: !49, file: !12, line: 38, column: 9)
!55 = !DILocation(line: 39, column: 28, scope: !54)
!56 = !DILocation(line: 39, column: 18, scope: !54)
!57 = !DILocation(line: 39, column: 13, scope: !54)
!58 = !DILocation(line: 39, column: 21, scope: !54)
!59 = !DILocation(line: 40, column: 9, scope: !54)
!60 = !DILocation(line: 37, column: 35, scope: !49)
!61 = !DILocation(line: 37, column: 9, scope: !49)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 40, column: 9, scope: !46)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 41, column: 9, scope: !30)
!66 = !DILocation(line: 41, column: 20, scope: !30)
!67 = !DILocation(line: 42, column: 19, scope: !30)
!68 = !DILocation(line: 42, column: 9, scope: !30)
!69 = !DILocation(line: 44, column: 1, scope: !11)
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_61_good", scope: !12, file: !12, line: 73, type: !13, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 75, column: 5, scope: !70)
!72 = !DILocation(line: 76, column: 1, scope: !70)
!73 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 88, type: !74, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!76, !76, !77}
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !12, line: 88, type: !76)
!79 = !DILocation(line: 88, column: 14, scope: !73)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !12, line: 88, type: !77)
!81 = !DILocation(line: 88, column: 27, scope: !73)
!82 = !DILocation(line: 91, column: 22, scope: !73)
!83 = !DILocation(line: 91, column: 12, scope: !73)
!84 = !DILocation(line: 91, column: 5, scope: !73)
!85 = !DILocation(line: 93, column: 5, scope: !73)
!86 = !DILocation(line: 94, column: 5, scope: !73)
!87 = !DILocation(line: 95, column: 5, scope: !73)
!88 = !DILocation(line: 98, column: 5, scope: !73)
!89 = !DILocation(line: 99, column: 5, scope: !73)
!90 = !DILocation(line: 100, column: 5, scope: !73)
!91 = !DILocation(line: 102, column: 5, scope: !73)
!92 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !12, line: 55, type: !16)
!94 = !DILocation(line: 55, column: 12, scope: !92)
!95 = !DILocalVariable(name: "dataBuffer", scope: !92, file: !12, line: 56, type: !20)
!96 = !DILocation(line: 56, column: 10, scope: !92)
!97 = !DILocation(line: 57, column: 12, scope: !92)
!98 = !DILocation(line: 57, column: 10, scope: !92)
!99 = !DILocation(line: 58, column: 91, scope: !92)
!100 = !DILocation(line: 58, column: 12, scope: !92)
!101 = !DILocation(line: 58, column: 10, scope: !92)
!102 = !DILocalVariable(name: "dest", scope: !103, file: !12, line: 60, type: !31)
!103 = distinct !DILexicalBlock(scope: !92, file: !12, line: 59, column: 5)
!104 = !DILocation(line: 60, column: 14, scope: !103)
!105 = !DILocalVariable(name: "i", scope: !103, file: !12, line: 61, type: !36)
!106 = !DILocation(line: 61, column: 16, scope: !103)
!107 = !DILocalVariable(name: "dataLen", scope: !103, file: !12, line: 61, type: !36)
!108 = !DILocation(line: 61, column: 19, scope: !103)
!109 = !DILocation(line: 62, column: 26, scope: !103)
!110 = !DILocation(line: 62, column: 19, scope: !103)
!111 = !DILocation(line: 62, column: 17, scope: !103)
!112 = !DILocation(line: 64, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !103, file: !12, line: 64, column: 9)
!114 = !DILocation(line: 64, column: 14, scope: !113)
!115 = !DILocation(line: 64, column: 21, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !12, line: 64, column: 9)
!117 = !DILocation(line: 64, column: 25, scope: !116)
!118 = !DILocation(line: 64, column: 23, scope: !116)
!119 = !DILocation(line: 64, column: 9, scope: !113)
!120 = !DILocation(line: 66, column: 23, scope: !121)
!121 = distinct !DILexicalBlock(scope: !116, file: !12, line: 65, column: 9)
!122 = !DILocation(line: 66, column: 28, scope: !121)
!123 = !DILocation(line: 66, column: 18, scope: !121)
!124 = !DILocation(line: 66, column: 13, scope: !121)
!125 = !DILocation(line: 66, column: 21, scope: !121)
!126 = !DILocation(line: 67, column: 9, scope: !121)
!127 = !DILocation(line: 64, column: 35, scope: !116)
!128 = !DILocation(line: 64, column: 9, scope: !116)
!129 = distinct !{!129, !119, !130, !64}
!130 = !DILocation(line: 67, column: 9, scope: !113)
!131 = !DILocation(line: 68, column: 9, scope: !103)
!132 = !DILocation(line: 68, column: 20, scope: !103)
!133 = !DILocation(line: 69, column: 19, scope: !103)
!134 = !DILocation(line: 69, column: 9, scope: !103)
!135 = !DILocation(line: 71, column: 1, scope: !92)
