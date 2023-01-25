; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  store i8* %arraydecay, i8** %data, align 8, !dbg !25
  %0 = load i8*, i8** %data, align 8, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !27
  %1 = load i8*, i8** %data, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !30, metadata !DIExpression()), !dbg !32
  %2 = load i8*, i8** %data, align 8, !dbg !33
  store i8* %2, i8** %dataCopy, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !34, metadata !DIExpression()), !dbg !35
  %3 = load i8*, i8** %dataCopy, align 8, !dbg !36
  store i8* %3, i8** %data1, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !48, metadata !DIExpression()), !dbg !49
  %5 = load i8*, i8** %data1, align 8, !dbg !50
  %call = call i64 @strlen(i8* %5) #6, !dbg !51
  store i64 %call, i64* %dataLen, align 8, !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !56
  %7 = load i64, i64* %dataLen, align 8, !dbg !58
  %cmp = icmp ult i64 %6, %7, !dbg !59
  br i1 %cmp, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data1, align 8, !dbg !61
  %9 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx2 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !61
  %10 = load i8, i8* %arrayidx2, align 1, !dbg !61
  %11 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !65
  store i8 %10, i8* %arrayidx3, align 1, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %12, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !73
  store i8 0, i8* %arrayidx4, align 1, !dbg !74
  %13 = load i8*, i8** %data1, align 8, !dbg !75
  call void @printLine(i8* %13), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_31_good() #0 !dbg !78 {
entry:
  call void @goodG2B(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* null) #7, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #7, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_31_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_31_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !100 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !105
  store i8* %arraydecay, i8** %data, align 8, !dbg !106
  %0 = load i8*, i8** %data, align 8, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !108
  %1 = load i8*, i8** %data, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !109
  store i8 0, i8* %arrayidx, align 1, !dbg !110
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !111, metadata !DIExpression()), !dbg !113
  %2 = load i8*, i8** %data, align 8, !dbg !114
  store i8* %2, i8** %dataCopy, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !115, metadata !DIExpression()), !dbg !116
  %3 = load i8*, i8** %dataCopy, align 8, !dbg !117
  store i8* %3, i8** %data1, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !118, metadata !DIExpression()), !dbg !120
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !120
  call void @llvm.dbg.declare(metadata i64* %i, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !123, metadata !DIExpression()), !dbg !124
  %5 = load i8*, i8** %data1, align 8, !dbg !125
  %call = call i64 @strlen(i8* %5) #6, !dbg !126
  store i64 %call, i64* %dataLen, align 8, !dbg !127
  store i64 0, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !130

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !131
  %7 = load i64, i64* %dataLen, align 8, !dbg !133
  %cmp = icmp ult i64 %6, %7, !dbg !134
  br i1 %cmp, label %for.body, label %for.end, !dbg !135

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data1, align 8, !dbg !136
  %9 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx2 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !136
  %10 = load i8, i8* %arrayidx2, align 1, !dbg !136
  %11 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !140
  store i8 %10, i8* %arrayidx3, align 1, !dbg !141
  br label %for.inc, !dbg !142

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !143
  %inc = add i64 %12, 1, !dbg !143
  store i64 %inc, i64* %i, align 8, !dbg !143
  br label %for.cond, !dbg !144, !llvm.loop !145

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !147
  store i8 0, i8* %arrayidx4, align 1, !dbg !148
  %13 = load i8*, i8** %data1, align 8, !dbg !149
  call void @printLine(i8* %13), !dbg !150
  ret void, !dbg !151
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_31_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocation(line: 27, column: 12, scope: !11)
!25 = !DILocation(line: 27, column: 10, scope: !11)
!26 = !DILocation(line: 29, column: 12, scope: !11)
!27 = !DILocation(line: 29, column: 5, scope: !11)
!28 = !DILocation(line: 30, column: 5, scope: !11)
!29 = !DILocation(line: 30, column: 17, scope: !11)
!30 = !DILocalVariable(name: "dataCopy", scope: !31, file: !12, line: 32, type: !16)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!32 = !DILocation(line: 32, column: 16, scope: !31)
!33 = !DILocation(line: 32, column: 27, scope: !31)
!34 = !DILocalVariable(name: "data", scope: !31, file: !12, line: 33, type: !16)
!35 = !DILocation(line: 33, column: 16, scope: !31)
!36 = !DILocation(line: 33, column: 23, scope: !31)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !12, line: 35, type: !39)
!38 = distinct !DILexicalBlock(scope: !31, file: !12, line: 34, column: 9)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 35, column: 18, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !38, file: !12, line: 36, type: !44)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 36, column: 20, scope: !38)
!48 = !DILocalVariable(name: "dataLen", scope: !38, file: !12, line: 36, type: !44)
!49 = !DILocation(line: 36, column: 23, scope: !38)
!50 = !DILocation(line: 37, column: 30, scope: !38)
!51 = !DILocation(line: 37, column: 23, scope: !38)
!52 = !DILocation(line: 37, column: 21, scope: !38)
!53 = !DILocation(line: 39, column: 20, scope: !54)
!54 = distinct !DILexicalBlock(scope: !38, file: !12, line: 39, column: 13)
!55 = !DILocation(line: 39, column: 18, scope: !54)
!56 = !DILocation(line: 39, column: 25, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !12, line: 39, column: 13)
!58 = !DILocation(line: 39, column: 29, scope: !57)
!59 = !DILocation(line: 39, column: 27, scope: !57)
!60 = !DILocation(line: 39, column: 13, scope: !54)
!61 = !DILocation(line: 41, column: 27, scope: !62)
!62 = distinct !DILexicalBlock(scope: !57, file: !12, line: 40, column: 13)
!63 = !DILocation(line: 41, column: 32, scope: !62)
!64 = !DILocation(line: 41, column: 22, scope: !62)
!65 = !DILocation(line: 41, column: 17, scope: !62)
!66 = !DILocation(line: 41, column: 25, scope: !62)
!67 = !DILocation(line: 42, column: 13, scope: !62)
!68 = !DILocation(line: 39, column: 39, scope: !57)
!69 = !DILocation(line: 39, column: 13, scope: !57)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 42, column: 13, scope: !54)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 43, column: 13, scope: !38)
!74 = !DILocation(line: 43, column: 24, scope: !38)
!75 = !DILocation(line: 44, column: 23, scope: !38)
!76 = !DILocation(line: 44, column: 13, scope: !38)
!77 = !DILocation(line: 47, column: 1, scope: !11)
!78 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_31_good", scope: !12, file: !12, line: 80, type: !13, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocation(line: 82, column: 5, scope: !78)
!80 = !DILocation(line: 83, column: 1, scope: !78)
!81 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 94, type: !82, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!84, !84, !85}
!84 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !12, line: 94, type: !84)
!87 = !DILocation(line: 94, column: 14, scope: !81)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !12, line: 94, type: !85)
!89 = !DILocation(line: 94, column: 27, scope: !81)
!90 = !DILocation(line: 97, column: 22, scope: !81)
!91 = !DILocation(line: 97, column: 12, scope: !81)
!92 = !DILocation(line: 97, column: 5, scope: !81)
!93 = !DILocation(line: 99, column: 5, scope: !81)
!94 = !DILocation(line: 100, column: 5, scope: !81)
!95 = !DILocation(line: 101, column: 5, scope: !81)
!96 = !DILocation(line: 104, column: 5, scope: !81)
!97 = !DILocation(line: 105, column: 5, scope: !81)
!98 = !DILocation(line: 106, column: 5, scope: !81)
!99 = !DILocation(line: 108, column: 5, scope: !81)
!100 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !12, line: 56, type: !16)
!102 = !DILocation(line: 56, column: 12, scope: !100)
!103 = !DILocalVariable(name: "dataBuffer", scope: !100, file: !12, line: 57, type: !20)
!104 = !DILocation(line: 57, column: 10, scope: !100)
!105 = !DILocation(line: 58, column: 12, scope: !100)
!106 = !DILocation(line: 58, column: 10, scope: !100)
!107 = !DILocation(line: 60, column: 12, scope: !100)
!108 = !DILocation(line: 60, column: 5, scope: !100)
!109 = !DILocation(line: 61, column: 5, scope: !100)
!110 = !DILocation(line: 61, column: 16, scope: !100)
!111 = !DILocalVariable(name: "dataCopy", scope: !112, file: !12, line: 63, type: !16)
!112 = distinct !DILexicalBlock(scope: !100, file: !12, line: 62, column: 5)
!113 = !DILocation(line: 63, column: 16, scope: !112)
!114 = !DILocation(line: 63, column: 27, scope: !112)
!115 = !DILocalVariable(name: "data", scope: !112, file: !12, line: 64, type: !16)
!116 = !DILocation(line: 64, column: 16, scope: !112)
!117 = !DILocation(line: 64, column: 23, scope: !112)
!118 = !DILocalVariable(name: "dest", scope: !119, file: !12, line: 66, type: !39)
!119 = distinct !DILexicalBlock(scope: !112, file: !12, line: 65, column: 9)
!120 = !DILocation(line: 66, column: 18, scope: !119)
!121 = !DILocalVariable(name: "i", scope: !119, file: !12, line: 67, type: !44)
!122 = !DILocation(line: 67, column: 20, scope: !119)
!123 = !DILocalVariable(name: "dataLen", scope: !119, file: !12, line: 67, type: !44)
!124 = !DILocation(line: 67, column: 23, scope: !119)
!125 = !DILocation(line: 68, column: 30, scope: !119)
!126 = !DILocation(line: 68, column: 23, scope: !119)
!127 = !DILocation(line: 68, column: 21, scope: !119)
!128 = !DILocation(line: 70, column: 20, scope: !129)
!129 = distinct !DILexicalBlock(scope: !119, file: !12, line: 70, column: 13)
!130 = !DILocation(line: 70, column: 18, scope: !129)
!131 = !DILocation(line: 70, column: 25, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !12, line: 70, column: 13)
!133 = !DILocation(line: 70, column: 29, scope: !132)
!134 = !DILocation(line: 70, column: 27, scope: !132)
!135 = !DILocation(line: 70, column: 13, scope: !129)
!136 = !DILocation(line: 72, column: 27, scope: !137)
!137 = distinct !DILexicalBlock(scope: !132, file: !12, line: 71, column: 13)
!138 = !DILocation(line: 72, column: 32, scope: !137)
!139 = !DILocation(line: 72, column: 22, scope: !137)
!140 = !DILocation(line: 72, column: 17, scope: !137)
!141 = !DILocation(line: 72, column: 25, scope: !137)
!142 = !DILocation(line: 73, column: 13, scope: !137)
!143 = !DILocation(line: 70, column: 39, scope: !132)
!144 = !DILocation(line: 70, column: 13, scope: !132)
!145 = distinct !{!145, !135, !146, !72}
!146 = !DILocation(line: 73, column: 13, scope: !129)
!147 = !DILocation(line: 74, column: 13, scope: !119)
!148 = !DILocation(line: 74, column: 24, scope: !119)
!149 = !DILocation(line: 75, column: 23, scope: !119)
!150 = !DILocation(line: 75, column: 13, scope: !119)
!151 = !DILocation(line: 78, column: 1, scope: !100)
