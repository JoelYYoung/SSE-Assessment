; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  store i8* %arraydecay, i8** %data, align 8, !dbg !30
  %0 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !33, metadata !DIExpression()), !dbg !35
  %1 = load i8*, i8** %data, align 8, !dbg !36
  store i8* %1, i8** %dataCopy, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !37, metadata !DIExpression()), !dbg !38
  %2 = load i8*, i8** %dataCopy, align 8, !dbg !39
  store i8* %2, i8** %data1, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !46, metadata !DIExpression()), !dbg !47
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !48
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !49
  store i8 0, i8* %arrayidx3, align 1, !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !54
  %cmp = icmp ult i64 %3, 100, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %4, !dbg !60
  %5 = load i8, i8* %arrayidx4, align 1, !dbg !60
  %6 = load i8*, i8** %data1, align 8, !dbg !61
  %7 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx5 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !61
  store i8 %5, i8* %arrayidx5, align 1, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %8, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data1, align 8, !dbg !70
  %arrayidx6 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !70
  store i8 0, i8* %arrayidx6, align 1, !dbg !71
  %10 = load i8*, i8** %data1, align 8, !dbg !72
  call void @printLine(i8* %10), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_31_good() #0 !dbg !75 {
entry:
  call void @goodG2B(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #5, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #5, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_31_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_31_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !97 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !104
  store i8* %arraydecay, i8** %data, align 8, !dbg !105
  %0 = load i8*, i8** %data, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !106
  store i8 0, i8* %arrayidx, align 1, !dbg !107
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !108, metadata !DIExpression()), !dbg !110
  %1 = load i8*, i8** %data, align 8, !dbg !111
  store i8* %1, i8** %dataCopy, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !112, metadata !DIExpression()), !dbg !113
  %2 = load i8*, i8** %dataCopy, align 8, !dbg !114
  store i8* %2, i8** %data1, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i64* %i, metadata !115, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !118, metadata !DIExpression()), !dbg !119
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !120
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !121
  store i8 0, i8* %arrayidx3, align 1, !dbg !122
  store i64 0, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !126
  %cmp = icmp ult i64 %3, 100, !dbg !128
  br i1 %cmp, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %4, !dbg !132
  %5 = load i8, i8* %arrayidx4, align 1, !dbg !132
  %6 = load i8*, i8** %data1, align 8, !dbg !133
  %7 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx5 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !133
  store i8 %5, i8* %arrayidx5, align 1, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %8, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data1, align 8, !dbg !141
  %arrayidx6 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !141
  store i8 0, i8* %arrayidx6, align 1, !dbg !142
  %10 = load i8*, i8** %data1, align 8, !dbg !143
  call void @printLine(i8* %10), !dbg !144
  ret void, !dbg !145
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_31_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 27, column: 10, scope: !11)
!29 = !DILocation(line: 30, column: 12, scope: !11)
!30 = !DILocation(line: 30, column: 10, scope: !11)
!31 = !DILocation(line: 31, column: 5, scope: !11)
!32 = !DILocation(line: 31, column: 13, scope: !11)
!33 = !DILocalVariable(name: "dataCopy", scope: !34, file: !12, line: 33, type: !16)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!35 = !DILocation(line: 33, column: 16, scope: !34)
!36 = !DILocation(line: 33, column: 27, scope: !34)
!37 = !DILocalVariable(name: "data", scope: !34, file: !12, line: 34, type: !16)
!38 = !DILocation(line: 34, column: 16, scope: !34)
!39 = !DILocation(line: 34, column: 23, scope: !34)
!40 = !DILocalVariable(name: "i", scope: !41, file: !12, line: 36, type: !42)
!41 = distinct !DILexicalBlock(scope: !34, file: !12, line: 35, column: 9)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 36, column: 20, scope: !41)
!46 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 37, type: !25)
!47 = !DILocation(line: 37, column: 18, scope: !41)
!48 = !DILocation(line: 38, column: 13, scope: !41)
!49 = !DILocation(line: 39, column: 13, scope: !41)
!50 = !DILocation(line: 39, column: 27, scope: !41)
!51 = !DILocation(line: 41, column: 20, scope: !52)
!52 = distinct !DILexicalBlock(scope: !41, file: !12, line: 41, column: 13)
!53 = !DILocation(line: 41, column: 18, scope: !52)
!54 = !DILocation(line: 41, column: 25, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !12, line: 41, column: 13)
!56 = !DILocation(line: 41, column: 27, scope: !55)
!57 = !DILocation(line: 41, column: 13, scope: !52)
!58 = !DILocation(line: 43, column: 34, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !12, line: 42, column: 13)
!60 = !DILocation(line: 43, column: 27, scope: !59)
!61 = !DILocation(line: 43, column: 17, scope: !59)
!62 = !DILocation(line: 43, column: 22, scope: !59)
!63 = !DILocation(line: 43, column: 25, scope: !59)
!64 = !DILocation(line: 44, column: 13, scope: !59)
!65 = !DILocation(line: 41, column: 35, scope: !55)
!66 = !DILocation(line: 41, column: 13, scope: !55)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 44, column: 13, scope: !52)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 45, column: 13, scope: !41)
!71 = !DILocation(line: 45, column: 25, scope: !41)
!72 = !DILocation(line: 46, column: 23, scope: !41)
!73 = !DILocation(line: 46, column: 13, scope: !41)
!74 = !DILocation(line: 49, column: 1, scope: !11)
!75 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_31_good", scope: !12, file: !12, line: 83, type: !13, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 85, column: 5, scope: !75)
!77 = !DILocation(line: 86, column: 1, scope: !75)
!78 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 97, type: !79, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!81, !81, !82}
!81 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !12, line: 97, type: !81)
!84 = !DILocation(line: 97, column: 14, scope: !78)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !12, line: 97, type: !82)
!86 = !DILocation(line: 97, column: 27, scope: !78)
!87 = !DILocation(line: 100, column: 22, scope: !78)
!88 = !DILocation(line: 100, column: 12, scope: !78)
!89 = !DILocation(line: 100, column: 5, scope: !78)
!90 = !DILocation(line: 102, column: 5, scope: !78)
!91 = !DILocation(line: 103, column: 5, scope: !78)
!92 = !DILocation(line: 104, column: 5, scope: !78)
!93 = !DILocation(line: 107, column: 5, scope: !78)
!94 = !DILocation(line: 108, column: 5, scope: !78)
!95 = !DILocation(line: 109, column: 5, scope: !78)
!96 = !DILocation(line: 111, column: 5, scope: !78)
!97 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 58, type: !16)
!99 = !DILocation(line: 58, column: 12, scope: !97)
!100 = !DILocalVariable(name: "dataBadBuffer", scope: !97, file: !12, line: 59, type: !20)
!101 = !DILocation(line: 59, column: 10, scope: !97)
!102 = !DILocalVariable(name: "dataGoodBuffer", scope: !97, file: !12, line: 60, type: !25)
!103 = !DILocation(line: 60, column: 10, scope: !97)
!104 = !DILocation(line: 62, column: 12, scope: !97)
!105 = !DILocation(line: 62, column: 10, scope: !97)
!106 = !DILocation(line: 63, column: 5, scope: !97)
!107 = !DILocation(line: 63, column: 13, scope: !97)
!108 = !DILocalVariable(name: "dataCopy", scope: !109, file: !12, line: 65, type: !16)
!109 = distinct !DILexicalBlock(scope: !97, file: !12, line: 64, column: 5)
!110 = !DILocation(line: 65, column: 16, scope: !109)
!111 = !DILocation(line: 65, column: 27, scope: !109)
!112 = !DILocalVariable(name: "data", scope: !109, file: !12, line: 66, type: !16)
!113 = !DILocation(line: 66, column: 16, scope: !109)
!114 = !DILocation(line: 66, column: 23, scope: !109)
!115 = !DILocalVariable(name: "i", scope: !116, file: !12, line: 68, type: !42)
!116 = distinct !DILexicalBlock(scope: !109, file: !12, line: 67, column: 9)
!117 = !DILocation(line: 68, column: 20, scope: !116)
!118 = !DILocalVariable(name: "source", scope: !116, file: !12, line: 69, type: !25)
!119 = !DILocation(line: 69, column: 18, scope: !116)
!120 = !DILocation(line: 70, column: 13, scope: !116)
!121 = !DILocation(line: 71, column: 13, scope: !116)
!122 = !DILocation(line: 71, column: 27, scope: !116)
!123 = !DILocation(line: 73, column: 20, scope: !124)
!124 = distinct !DILexicalBlock(scope: !116, file: !12, line: 73, column: 13)
!125 = !DILocation(line: 73, column: 18, scope: !124)
!126 = !DILocation(line: 73, column: 25, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !12, line: 73, column: 13)
!128 = !DILocation(line: 73, column: 27, scope: !127)
!129 = !DILocation(line: 73, column: 13, scope: !124)
!130 = !DILocation(line: 75, column: 34, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !12, line: 74, column: 13)
!132 = !DILocation(line: 75, column: 27, scope: !131)
!133 = !DILocation(line: 75, column: 17, scope: !131)
!134 = !DILocation(line: 75, column: 22, scope: !131)
!135 = !DILocation(line: 75, column: 25, scope: !131)
!136 = !DILocation(line: 76, column: 13, scope: !131)
!137 = !DILocation(line: 73, column: 35, scope: !127)
!138 = !DILocation(line: 73, column: 13, scope: !127)
!139 = distinct !{!139, !129, !140, !69}
!140 = !DILocation(line: 76, column: 13, scope: !124)
!141 = !DILocation(line: 77, column: 13, scope: !116)
!142 = !DILocation(line: 77, column: 25, scope: !116)
!143 = !DILocation(line: 78, column: 23, scope: !116)
!144 = !DILocation(line: 78, column: 13, scope: !116)
!145 = !DILocation(line: 81, column: 1, scope: !97)
