; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_18.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_18_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source1 = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  br label %source, !dbg !29

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !30), !dbg !31
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !32
  store i8* %arraydecay, i8** %data, align 8, !dbg !33
  %0 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [100 x i8]* %source1, metadata !42, metadata !DIExpression()), !dbg !43
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 0, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !44
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 99, !dbg !45
  store i8 0, i8* %arrayidx3, align 1, !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %source
  %1 = load i64, i64* %i, align 8, !dbg !50
  %cmp = icmp ult i64 %1, 100, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 %2, !dbg !56
  %3 = load i8, i8* %arrayidx4, align 1, !dbg !56
  %4 = load i8*, i8** %data, align 8, !dbg !57
  %5 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx5 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !57
  store i8 %3, i8* %arrayidx5, align 1, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %6, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !66
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !66
  store i8 0, i8* %arrayidx6, align 1, !dbg !67
  %8 = load i8*, i8** %data, align 8, !dbg !68
  call void @printLine(i8* %8), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_18_good() #0 !dbg !71 {
entry:
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_18_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_18_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !93 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source1 = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  br label %source, !dbg !100

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !101), !dbg !102
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !103
  store i8* %arraydecay, i8** %data, align 8, !dbg !104
  %0 = load i8*, i8** %data, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !105
  store i8 0, i8* %arrayidx, align 1, !dbg !106
  call void @llvm.dbg.declare(metadata i64* %i, metadata !107, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [100 x i8]* %source1, metadata !110, metadata !DIExpression()), !dbg !111
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 0, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !112
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 99, !dbg !113
  store i8 0, i8* %arrayidx3, align 1, !dbg !114
  store i64 0, i64* %i, align 8, !dbg !115
  br label %for.cond, !dbg !117

for.cond:                                         ; preds = %for.inc, %source
  %1 = load i64, i64* %i, align 8, !dbg !118
  %cmp = icmp ult i64 %1, 100, !dbg !120
  br i1 %cmp, label %for.body, label %for.end, !dbg !121

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !122
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 %2, !dbg !124
  %3 = load i8, i8* %arrayidx4, align 1, !dbg !124
  %4 = load i8*, i8** %data, align 8, !dbg !125
  %5 = load i64, i64* %i, align 8, !dbg !126
  %arrayidx5 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !125
  store i8 %3, i8* %arrayidx5, align 1, !dbg !127
  br label %for.inc, !dbg !128

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !129
  %inc = add i64 %6, 1, !dbg !129
  store i64 %inc, i64* %i, align 8, !dbg !129
  br label %for.cond, !dbg !130, !llvm.loop !131

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !133
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !133
  store i8 0, i8* %arrayidx6, align 1, !dbg !134
  %8 = load i8*, i8** %data, align 8, !dbg !135
  call void @printLine(i8* %8), !dbg !136
  ret void, !dbg !137
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_18.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_18_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_18.c", directory: "/root/SSE-Assessment")
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
!29 = !DILocation(line: 28, column: 5, scope: !11)
!30 = !DILabel(scope: !11, name: "source", file: !12, line: 29)
!31 = !DILocation(line: 29, column: 1, scope: !11)
!32 = !DILocation(line: 32, column: 12, scope: !11)
!33 = !DILocation(line: 32, column: 10, scope: !11)
!34 = !DILocation(line: 33, column: 5, scope: !11)
!35 = !DILocation(line: 33, column: 13, scope: !11)
!36 = !DILocalVariable(name: "i", scope: !37, file: !12, line: 35, type: !38)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 35, column: 16, scope: !37)
!42 = !DILocalVariable(name: "source", scope: !37, file: !12, line: 36, type: !25)
!43 = !DILocation(line: 36, column: 14, scope: !37)
!44 = !DILocation(line: 37, column: 9, scope: !37)
!45 = !DILocation(line: 38, column: 9, scope: !37)
!46 = !DILocation(line: 38, column: 23, scope: !37)
!47 = !DILocation(line: 40, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !37, file: !12, line: 40, column: 9)
!49 = !DILocation(line: 40, column: 14, scope: !48)
!50 = !DILocation(line: 40, column: 21, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !12, line: 40, column: 9)
!52 = !DILocation(line: 40, column: 23, scope: !51)
!53 = !DILocation(line: 40, column: 9, scope: !48)
!54 = !DILocation(line: 42, column: 30, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !12, line: 41, column: 9)
!56 = !DILocation(line: 42, column: 23, scope: !55)
!57 = !DILocation(line: 42, column: 13, scope: !55)
!58 = !DILocation(line: 42, column: 18, scope: !55)
!59 = !DILocation(line: 42, column: 21, scope: !55)
!60 = !DILocation(line: 43, column: 9, scope: !55)
!61 = !DILocation(line: 40, column: 31, scope: !51)
!62 = !DILocation(line: 40, column: 9, scope: !51)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 43, column: 9, scope: !48)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 44, column: 9, scope: !37)
!67 = !DILocation(line: 44, column: 21, scope: !37)
!68 = !DILocation(line: 45, column: 19, scope: !37)
!69 = !DILocation(line: 45, column: 9, scope: !37)
!70 = !DILocation(line: 47, column: 1, scope: !11)
!71 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_18_good", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 81, column: 5, scope: !71)
!73 = !DILocation(line: 82, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 94, type: !75, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!77, !77, !78}
!77 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !12, line: 94, type: !77)
!80 = !DILocation(line: 94, column: 14, scope: !74)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !12, line: 94, type: !78)
!82 = !DILocation(line: 94, column: 27, scope: !74)
!83 = !DILocation(line: 97, column: 22, scope: !74)
!84 = !DILocation(line: 97, column: 12, scope: !74)
!85 = !DILocation(line: 97, column: 5, scope: !74)
!86 = !DILocation(line: 99, column: 5, scope: !74)
!87 = !DILocation(line: 100, column: 5, scope: !74)
!88 = !DILocation(line: 101, column: 5, scope: !74)
!89 = !DILocation(line: 104, column: 5, scope: !74)
!90 = !DILocation(line: 105, column: 5, scope: !74)
!91 = !DILocation(line: 106, column: 5, scope: !74)
!92 = !DILocation(line: 108, column: 5, scope: !74)
!93 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !12, line: 56, type: !16)
!95 = !DILocation(line: 56, column: 12, scope: !93)
!96 = !DILocalVariable(name: "dataBadBuffer", scope: !93, file: !12, line: 57, type: !20)
!97 = !DILocation(line: 57, column: 10, scope: !93)
!98 = !DILocalVariable(name: "dataGoodBuffer", scope: !93, file: !12, line: 58, type: !25)
!99 = !DILocation(line: 58, column: 10, scope: !93)
!100 = !DILocation(line: 59, column: 5, scope: !93)
!101 = !DILabel(scope: !93, name: "source", file: !12, line: 60)
!102 = !DILocation(line: 60, column: 1, scope: !93)
!103 = !DILocation(line: 62, column: 12, scope: !93)
!104 = !DILocation(line: 62, column: 10, scope: !93)
!105 = !DILocation(line: 63, column: 5, scope: !93)
!106 = !DILocation(line: 63, column: 13, scope: !93)
!107 = !DILocalVariable(name: "i", scope: !108, file: !12, line: 65, type: !38)
!108 = distinct !DILexicalBlock(scope: !93, file: !12, line: 64, column: 5)
!109 = !DILocation(line: 65, column: 16, scope: !108)
!110 = !DILocalVariable(name: "source", scope: !108, file: !12, line: 66, type: !25)
!111 = !DILocation(line: 66, column: 14, scope: !108)
!112 = !DILocation(line: 67, column: 9, scope: !108)
!113 = !DILocation(line: 68, column: 9, scope: !108)
!114 = !DILocation(line: 68, column: 23, scope: !108)
!115 = !DILocation(line: 70, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !108, file: !12, line: 70, column: 9)
!117 = !DILocation(line: 70, column: 14, scope: !116)
!118 = !DILocation(line: 70, column: 21, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !12, line: 70, column: 9)
!120 = !DILocation(line: 70, column: 23, scope: !119)
!121 = !DILocation(line: 70, column: 9, scope: !116)
!122 = !DILocation(line: 72, column: 30, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !12, line: 71, column: 9)
!124 = !DILocation(line: 72, column: 23, scope: !123)
!125 = !DILocation(line: 72, column: 13, scope: !123)
!126 = !DILocation(line: 72, column: 18, scope: !123)
!127 = !DILocation(line: 72, column: 21, scope: !123)
!128 = !DILocation(line: 73, column: 9, scope: !123)
!129 = !DILocation(line: 70, column: 31, scope: !119)
!130 = !DILocation(line: 70, column: 9, scope: !119)
!131 = distinct !{!131, !121, !132, !65}
!132 = !DILocation(line: 73, column: 9, scope: !116)
!133 = !DILocation(line: 74, column: 9, scope: !108)
!134 = !DILocation(line: 74, column: 21, scope: !108)
!135 = !DILocation(line: 75, column: 19, scope: !108)
!136 = !DILocation(line: 75, column: 9, scope: !108)
!137 = !DILocation(line: 77, column: 1, scope: !93)
