; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_16.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_16_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !15, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  br label %while.body, !dbg !33

while.body:                                       ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i64* %arraydecay, i64** %data, align 8, !dbg !36
  br label %while.end, !dbg !37

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !38, metadata !DIExpression()), !dbg !40
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %while.end
  %1 = load i64, i64* %i, align 8, !dbg !50
  %cmp = icmp ult i64 %1, 100, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !56
  %3 = load i64, i64* %arrayidx, align 8, !dbg !56
  %4 = load i64*, i64** %data, align 8, !dbg !57
  %5 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !57
  store i64 %3, i64* %arrayidx1, align 8, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %6, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data, align 8, !dbg !66
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !66
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !66
  call void @printLongLongLine(i64 %8), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_16_good() #0 !dbg !69 {
entry:
  call void @goodG2B(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #5, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #5, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_16_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_16_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !93 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  br label %while.body, !dbg !100

while.body:                                       ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !101
  store i64* %arraydecay, i64** %data, align 8, !dbg !103
  br label %while.end, !dbg !104

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !107
  call void @llvm.dbg.declare(metadata i64* %i, metadata !108, metadata !DIExpression()), !dbg !110
  store i64 0, i64* %i, align 8, !dbg !111
  br label %for.cond, !dbg !113

for.cond:                                         ; preds = %for.inc, %while.end
  %1 = load i64, i64* %i, align 8, !dbg !114
  %cmp = icmp ult i64 %1, 100, !dbg !116
  br i1 %cmp, label %for.body, label %for.end, !dbg !117

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !118
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !120
  %3 = load i64, i64* %arrayidx, align 8, !dbg !120
  %4 = load i64*, i64** %data, align 8, !dbg !121
  %5 = load i64, i64* %i, align 8, !dbg !122
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !121
  store i64 %3, i64* %arrayidx1, align 8, !dbg !123
  br label %for.inc, !dbg !124

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !125
  %inc = add i64 %6, 1, !dbg !125
  store i64 %inc, i64* %i, align 8, !dbg !125
  br label %for.cond, !dbg !126, !llvm.loop !127

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data, align 8, !dbg !129
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !129
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !129
  call void @printLongLongLine(i64 %8), !dbg !130
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_16.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_16_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_16.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !18, line: 27, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !20, line: 44, baseType: !21)
!20 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!21 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!22 = !DILocation(line: 23, column: 15, scope: !11)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DILocation(line: 24, column: 13, scope: !11)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 25, column: 13, scope: !11)
!33 = !DILocation(line: 26, column: 5, scope: !11)
!34 = !DILocation(line: 30, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 27, column: 5)
!36 = !DILocation(line: 30, column: 14, scope: !35)
!37 = !DILocation(line: 31, column: 9, scope: !35)
!38 = !DILocalVariable(name: "source", scope: !39, file: !12, line: 34, type: !29)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!40 = !DILocation(line: 34, column: 17, scope: !39)
!41 = !DILocalVariable(name: "i", scope: !42, file: !12, line: 36, type: !43)
!42 = distinct !DILexicalBlock(scope: !39, file: !12, line: 35, column: 9)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 46, baseType: !45)
!44 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 36, column: 20, scope: !42)
!47 = !DILocation(line: 38, column: 20, scope: !48)
!48 = distinct !DILexicalBlock(scope: !42, file: !12, line: 38, column: 13)
!49 = !DILocation(line: 38, column: 18, scope: !48)
!50 = !DILocation(line: 38, column: 25, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !12, line: 38, column: 13)
!52 = !DILocation(line: 38, column: 27, scope: !51)
!53 = !DILocation(line: 38, column: 13, scope: !48)
!54 = !DILocation(line: 40, column: 34, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !12, line: 39, column: 13)
!56 = !DILocation(line: 40, column: 27, scope: !55)
!57 = !DILocation(line: 40, column: 17, scope: !55)
!58 = !DILocation(line: 40, column: 22, scope: !55)
!59 = !DILocation(line: 40, column: 25, scope: !55)
!60 = !DILocation(line: 41, column: 13, scope: !55)
!61 = !DILocation(line: 38, column: 35, scope: !51)
!62 = !DILocation(line: 38, column: 13, scope: !51)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 41, column: 13, scope: !48)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 42, column: 31, scope: !42)
!67 = !DILocation(line: 42, column: 13, scope: !42)
!68 = !DILocation(line: 45, column: 1, scope: !11)
!69 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_16_good", scope: !12, file: !12, line: 77, type: !13, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 79, column: 5, scope: !69)
!71 = !DILocation(line: 80, column: 1, scope: !69)
!72 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 92, type: !73, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!75, !75, !76}
!75 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !12, line: 92, type: !75)
!80 = !DILocation(line: 92, column: 14, scope: !72)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !12, line: 92, type: !76)
!82 = !DILocation(line: 92, column: 27, scope: !72)
!83 = !DILocation(line: 95, column: 22, scope: !72)
!84 = !DILocation(line: 95, column: 12, scope: !72)
!85 = !DILocation(line: 95, column: 5, scope: !72)
!86 = !DILocation(line: 97, column: 5, scope: !72)
!87 = !DILocation(line: 98, column: 5, scope: !72)
!88 = !DILocation(line: 99, column: 5, scope: !72)
!89 = !DILocation(line: 102, column: 5, scope: !72)
!90 = !DILocation(line: 103, column: 5, scope: !72)
!91 = !DILocation(line: 104, column: 5, scope: !72)
!92 = !DILocation(line: 106, column: 5, scope: !72)
!93 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !12, line: 54, type: !16)
!95 = !DILocation(line: 54, column: 15, scope: !93)
!96 = !DILocalVariable(name: "dataBadBuffer", scope: !93, file: !12, line: 55, type: !24)
!97 = !DILocation(line: 55, column: 13, scope: !93)
!98 = !DILocalVariable(name: "dataGoodBuffer", scope: !93, file: !12, line: 56, type: !29)
!99 = !DILocation(line: 56, column: 13, scope: !93)
!100 = !DILocation(line: 57, column: 5, scope: !93)
!101 = !DILocation(line: 60, column: 16, scope: !102)
!102 = distinct !DILexicalBlock(scope: !93, file: !12, line: 58, column: 5)
!103 = !DILocation(line: 60, column: 14, scope: !102)
!104 = !DILocation(line: 61, column: 9, scope: !102)
!105 = !DILocalVariable(name: "source", scope: !106, file: !12, line: 64, type: !29)
!106 = distinct !DILexicalBlock(scope: !93, file: !12, line: 63, column: 5)
!107 = !DILocation(line: 64, column: 17, scope: !106)
!108 = !DILocalVariable(name: "i", scope: !109, file: !12, line: 66, type: !43)
!109 = distinct !DILexicalBlock(scope: !106, file: !12, line: 65, column: 9)
!110 = !DILocation(line: 66, column: 20, scope: !109)
!111 = !DILocation(line: 68, column: 20, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !12, line: 68, column: 13)
!113 = !DILocation(line: 68, column: 18, scope: !112)
!114 = !DILocation(line: 68, column: 25, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !12, line: 68, column: 13)
!116 = !DILocation(line: 68, column: 27, scope: !115)
!117 = !DILocation(line: 68, column: 13, scope: !112)
!118 = !DILocation(line: 70, column: 34, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !12, line: 69, column: 13)
!120 = !DILocation(line: 70, column: 27, scope: !119)
!121 = !DILocation(line: 70, column: 17, scope: !119)
!122 = !DILocation(line: 70, column: 22, scope: !119)
!123 = !DILocation(line: 70, column: 25, scope: !119)
!124 = !DILocation(line: 71, column: 13, scope: !119)
!125 = !DILocation(line: 68, column: 35, scope: !115)
!126 = !DILocation(line: 68, column: 13, scope: !115)
!127 = distinct !{!127, !117, !128, !65}
!128 = !DILocation(line: 71, column: 13, scope: !112)
!129 = !DILocation(line: 72, column: 31, scope: !109)
!130 = !DILocation(line: 72, column: 13, scope: !109)
!131 = !DILocation(line: 75, column: 1, scope: !93)
