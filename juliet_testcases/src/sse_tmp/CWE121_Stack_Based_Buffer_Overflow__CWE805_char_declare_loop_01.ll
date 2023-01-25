; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_01_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
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
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !39, metadata !DIExpression()), !dbg !40
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !41
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !42
  store i8 0, i8* %arrayidx2, align 1, !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !47
  %cmp = icmp ult i64 %1, 100, !dbg !49
  br i1 %cmp, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !53
  %3 = load i8, i8* %arrayidx3, align 1, !dbg !53
  %4 = load i8*, i8** %data, align 8, !dbg !54
  %5 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !54
  store i8 %3, i8* %arrayidx4, align 1, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !58
  %inc = add i64 %6, 1, !dbg !58
  store i64 %inc, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !63
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !63
  store i8 0, i8* %arrayidx5, align 1, !dbg !64
  %8 = load i8*, i8** %data, align 8, !dbg !65
  call void @printLine(i8* %8), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_01_good() #0 !dbg !68 {
entry:
  call void @goodG2B(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #5, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #5, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_01_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_01_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !90 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !97
  store i8* %arraydecay, i8** %data, align 8, !dbg !98
  %0 = load i8*, i8** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !99
  store i8 0, i8* %arrayidx, align 1, !dbg !100
  call void @llvm.dbg.declare(metadata i64* %i, metadata !101, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !104, metadata !DIExpression()), !dbg !105
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !106
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !107
  store i8 0, i8* %arrayidx2, align 1, !dbg !108
  store i64 0, i64* %i, align 8, !dbg !109
  br label %for.cond, !dbg !111

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !112
  %cmp = icmp ult i64 %1, 100, !dbg !114
  br i1 %cmp, label %for.body, label %for.end, !dbg !115

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !116
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !118
  %3 = load i8, i8* %arrayidx3, align 1, !dbg !118
  %4 = load i8*, i8** %data, align 8, !dbg !119
  %5 = load i64, i64* %i, align 8, !dbg !120
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !119
  store i8 %3, i8* %arrayidx4, align 1, !dbg !121
  br label %for.inc, !dbg !122

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !123
  %inc = add i64 %6, 1, !dbg !123
  store i64 %inc, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !124, !llvm.loop !125

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !127
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !127
  store i8 0, i8* %arrayidx5, align 1, !dbg !128
  %8 = load i8*, i8** %data, align 8, !dbg !129
  call void @printLine(i8* %8), !dbg !130
  ret void, !dbg !131
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_01_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!33 = !DILocalVariable(name: "i", scope: !34, file: !12, line: 33, type: !35)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 46, baseType: !37)
!36 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!37 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 33, column: 16, scope: !34)
!39 = !DILocalVariable(name: "source", scope: !34, file: !12, line: 34, type: !25)
!40 = !DILocation(line: 34, column: 14, scope: !34)
!41 = !DILocation(line: 35, column: 9, scope: !34)
!42 = !DILocation(line: 36, column: 9, scope: !34)
!43 = !DILocation(line: 36, column: 23, scope: !34)
!44 = !DILocation(line: 38, column: 16, scope: !45)
!45 = distinct !DILexicalBlock(scope: !34, file: !12, line: 38, column: 9)
!46 = !DILocation(line: 38, column: 14, scope: !45)
!47 = !DILocation(line: 38, column: 21, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !12, line: 38, column: 9)
!49 = !DILocation(line: 38, column: 23, scope: !48)
!50 = !DILocation(line: 38, column: 9, scope: !45)
!51 = !DILocation(line: 40, column: 30, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !12, line: 39, column: 9)
!53 = !DILocation(line: 40, column: 23, scope: !52)
!54 = !DILocation(line: 40, column: 13, scope: !52)
!55 = !DILocation(line: 40, column: 18, scope: !52)
!56 = !DILocation(line: 40, column: 21, scope: !52)
!57 = !DILocation(line: 41, column: 9, scope: !52)
!58 = !DILocation(line: 38, column: 31, scope: !48)
!59 = !DILocation(line: 38, column: 9, scope: !48)
!60 = distinct !{!60, !50, !61, !62}
!61 = !DILocation(line: 41, column: 9, scope: !45)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 42, column: 9, scope: !34)
!64 = !DILocation(line: 42, column: 21, scope: !34)
!65 = !DILocation(line: 43, column: 19, scope: !34)
!66 = !DILocation(line: 43, column: 9, scope: !34)
!67 = !DILocation(line: 45, column: 1, scope: !11)
!68 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_01_good", scope: !12, file: !12, line: 75, type: !13, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 77, column: 5, scope: !68)
!70 = !DILocation(line: 78, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 90, type: !72, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!74, !74, !75}
!74 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !12, line: 90, type: !74)
!77 = !DILocation(line: 90, column: 14, scope: !71)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !12, line: 90, type: !75)
!79 = !DILocation(line: 90, column: 27, scope: !71)
!80 = !DILocation(line: 93, column: 22, scope: !71)
!81 = !DILocation(line: 93, column: 12, scope: !71)
!82 = !DILocation(line: 93, column: 5, scope: !71)
!83 = !DILocation(line: 95, column: 5, scope: !71)
!84 = !DILocation(line: 96, column: 5, scope: !71)
!85 = !DILocation(line: 97, column: 5, scope: !71)
!86 = !DILocation(line: 100, column: 5, scope: !71)
!87 = !DILocation(line: 101, column: 5, scope: !71)
!88 = !DILocation(line: 102, column: 5, scope: !71)
!89 = !DILocation(line: 104, column: 5, scope: !71)
!90 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !12, line: 54, type: !16)
!92 = !DILocation(line: 54, column: 12, scope: !90)
!93 = !DILocalVariable(name: "dataBadBuffer", scope: !90, file: !12, line: 55, type: !20)
!94 = !DILocation(line: 55, column: 10, scope: !90)
!95 = !DILocalVariable(name: "dataGoodBuffer", scope: !90, file: !12, line: 56, type: !25)
!96 = !DILocation(line: 56, column: 10, scope: !90)
!97 = !DILocation(line: 58, column: 12, scope: !90)
!98 = !DILocation(line: 58, column: 10, scope: !90)
!99 = !DILocation(line: 59, column: 5, scope: !90)
!100 = !DILocation(line: 59, column: 13, scope: !90)
!101 = !DILocalVariable(name: "i", scope: !102, file: !12, line: 61, type: !35)
!102 = distinct !DILexicalBlock(scope: !90, file: !12, line: 60, column: 5)
!103 = !DILocation(line: 61, column: 16, scope: !102)
!104 = !DILocalVariable(name: "source", scope: !102, file: !12, line: 62, type: !25)
!105 = !DILocation(line: 62, column: 14, scope: !102)
!106 = !DILocation(line: 63, column: 9, scope: !102)
!107 = !DILocation(line: 64, column: 9, scope: !102)
!108 = !DILocation(line: 64, column: 23, scope: !102)
!109 = !DILocation(line: 66, column: 16, scope: !110)
!110 = distinct !DILexicalBlock(scope: !102, file: !12, line: 66, column: 9)
!111 = !DILocation(line: 66, column: 14, scope: !110)
!112 = !DILocation(line: 66, column: 21, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !12, line: 66, column: 9)
!114 = !DILocation(line: 66, column: 23, scope: !113)
!115 = !DILocation(line: 66, column: 9, scope: !110)
!116 = !DILocation(line: 68, column: 30, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !12, line: 67, column: 9)
!118 = !DILocation(line: 68, column: 23, scope: !117)
!119 = !DILocation(line: 68, column: 13, scope: !117)
!120 = !DILocation(line: 68, column: 18, scope: !117)
!121 = !DILocation(line: 68, column: 21, scope: !117)
!122 = !DILocation(line: 69, column: 9, scope: !117)
!123 = !DILocation(line: 66, column: 31, scope: !113)
!124 = !DILocation(line: 66, column: 9, scope: !113)
!125 = distinct !{!125, !115, !126, !62}
!126 = !DILocation(line: 69, column: 9, scope: !110)
!127 = !DILocation(line: 70, column: 9, scope: !102)
!128 = !DILocation(line: 70, column: 21, scope: !102)
!129 = !DILocation(line: 71, column: 19, scope: !102)
!130 = !DILocation(line: 71, column: 9, scope: !102)
!131 = !DILocation(line: 73, column: 1, scope: !90)
