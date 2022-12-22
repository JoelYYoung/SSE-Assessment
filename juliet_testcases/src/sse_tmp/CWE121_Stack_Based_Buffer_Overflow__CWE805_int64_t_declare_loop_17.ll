; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i1 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i64** %data, metadata !18, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  store i32 0, i32* %i, align 4, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !39
  %cmp = icmp slt i32 %0, 1, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !43
  store i64* %arraydecay, i64** %data, align 8, !dbg !45
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !47
  %inc = add nsw i32 %1, 1, !dbg !47
  store i32 %inc, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !52, metadata !DIExpression()), !dbg !54
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !54
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !55, metadata !DIExpression()), !dbg !60
  store i64 0, i64* %i1, align 8, !dbg !61
  br label %for.cond2, !dbg !63

for.cond2:                                        ; preds = %for.inc6, %for.end
  %3 = load i64, i64* %i1, align 8, !dbg !64
  %cmp3 = icmp ult i64 %3, 100, !dbg !66
  br i1 %cmp3, label %for.body4, label %for.end8, !dbg !67

for.body4:                                        ; preds = %for.cond2
  %4 = load i64, i64* %i1, align 8, !dbg !68
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %4, !dbg !70
  %5 = load i64, i64* %arrayidx, align 8, !dbg !70
  %6 = load i64*, i64** %data, align 8, !dbg !71
  %7 = load i64, i64* %i1, align 8, !dbg !72
  %arrayidx5 = getelementptr inbounds i64, i64* %6, i64 %7, !dbg !71
  store i64 %5, i64* %arrayidx5, align 8, !dbg !73
  br label %for.inc6, !dbg !74

for.inc6:                                         ; preds = %for.body4
  %8 = load i64, i64* %i1, align 8, !dbg !75
  %inc7 = add i64 %8, 1, !dbg !75
  store i64 %inc7, i64* %i1, align 8, !dbg !75
  br label %for.cond2, !dbg !76, !llvm.loop !77

for.end8:                                         ; preds = %for.cond2
  %9 = load i64*, i64** %data, align 8, !dbg !79
  %arrayidx9 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !79
  %10 = load i64, i64* %arrayidx9, align 8, !dbg !79
  call void @printLongLongLine(i64 %10), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_17_good() #0 !dbg !82 {
entry:
  call void @goodG2B(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #5, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #5, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_17_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_17_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !105 {
entry:
  %h = alloca i32, align 4
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata i64** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  store i32 0, i32* %h, align 4, !dbg !114
  br label %for.cond, !dbg !116

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !117
  %cmp = icmp slt i32 %0, 1, !dbg !119
  br i1 %cmp, label %for.body, label %for.end, !dbg !120

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !121
  store i64* %arraydecay, i64** %data, align 8, !dbg !123
  br label %for.inc, !dbg !124

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !125
  %inc = add nsw i32 %1, 1, !dbg !125
  store i32 %inc, i32* %h, align 4, !dbg !125
  br label %for.cond, !dbg !126, !llvm.loop !127

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !129, metadata !DIExpression()), !dbg !131
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !131
  call void @llvm.dbg.declare(metadata i64* %i, metadata !132, metadata !DIExpression()), !dbg !134
  store i64 0, i64* %i, align 8, !dbg !135
  br label %for.cond1, !dbg !137

for.cond1:                                        ; preds = %for.inc5, %for.end
  %3 = load i64, i64* %i, align 8, !dbg !138
  %cmp2 = icmp ult i64 %3, 100, !dbg !140
  br i1 %cmp2, label %for.body3, label %for.end7, !dbg !141

for.body3:                                        ; preds = %for.cond1
  %4 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %4, !dbg !144
  %5 = load i64, i64* %arrayidx, align 8, !dbg !144
  %6 = load i64*, i64** %data, align 8, !dbg !145
  %7 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx4 = getelementptr inbounds i64, i64* %6, i64 %7, !dbg !145
  store i64 %5, i64* %arrayidx4, align 8, !dbg !147
  br label %for.inc5, !dbg !148

for.inc5:                                         ; preds = %for.body3
  %8 = load i64, i64* %i, align 8, !dbg !149
  %inc6 = add i64 %8, 1, !dbg !149
  store i64 %inc6, i64* %i, align 8, !dbg !149
  br label %for.cond1, !dbg !150, !llvm.loop !151

for.end7:                                         ; preds = %for.cond1
  %9 = load i64*, i64** %data, align 8, !dbg !153
  %arrayidx8 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !153
  %10 = load i64, i64* %arrayidx8, align 8, !dbg !153
  call void @printLongLongLine(i64 %10), !dbg !154
  ret void, !dbg !155
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_17.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_17_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_17.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 23, column: 9, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !21, line: 27, baseType: !22)
!21 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !23, line: 43, baseType: !24)
!23 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!24 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!25 = !DILocation(line: 24, column: 15, scope: !11)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 25, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 50)
!30 = !DILocation(line: 25, column: 13, scope: !11)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 26, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 6400, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 26, column: 13, scope: !11)
!36 = !DILocation(line: 27, column: 11, scope: !37)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 27, column: 5)
!38 = !DILocation(line: 27, column: 9, scope: !37)
!39 = !DILocation(line: 27, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !12, line: 27, column: 5)
!41 = !DILocation(line: 27, column: 18, scope: !40)
!42 = !DILocation(line: 27, column: 5, scope: !37)
!43 = !DILocation(line: 31, column: 16, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !12, line: 28, column: 5)
!45 = !DILocation(line: 31, column: 14, scope: !44)
!46 = !DILocation(line: 32, column: 5, scope: !44)
!47 = !DILocation(line: 27, column: 24, scope: !40)
!48 = !DILocation(line: 27, column: 5, scope: !40)
!49 = distinct !{!49, !42, !50, !51}
!50 = !DILocation(line: 32, column: 5, scope: !37)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !DILocalVariable(name: "source", scope: !53, file: !12, line: 34, type: !32)
!53 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!54 = !DILocation(line: 34, column: 17, scope: !53)
!55 = !DILocalVariable(name: "i", scope: !56, file: !12, line: 36, type: !57)
!56 = distinct !DILexicalBlock(scope: !53, file: !12, line: 35, column: 9)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !58, line: 46, baseType: !59)
!58 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!59 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!60 = !DILocation(line: 36, column: 20, scope: !56)
!61 = !DILocation(line: 38, column: 20, scope: !62)
!62 = distinct !DILexicalBlock(scope: !56, file: !12, line: 38, column: 13)
!63 = !DILocation(line: 38, column: 18, scope: !62)
!64 = !DILocation(line: 38, column: 25, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !12, line: 38, column: 13)
!66 = !DILocation(line: 38, column: 27, scope: !65)
!67 = !DILocation(line: 38, column: 13, scope: !62)
!68 = !DILocation(line: 40, column: 34, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !12, line: 39, column: 13)
!70 = !DILocation(line: 40, column: 27, scope: !69)
!71 = !DILocation(line: 40, column: 17, scope: !69)
!72 = !DILocation(line: 40, column: 22, scope: !69)
!73 = !DILocation(line: 40, column: 25, scope: !69)
!74 = !DILocation(line: 41, column: 13, scope: !69)
!75 = !DILocation(line: 38, column: 35, scope: !65)
!76 = !DILocation(line: 38, column: 13, scope: !65)
!77 = distinct !{!77, !67, !78, !51}
!78 = !DILocation(line: 41, column: 13, scope: !62)
!79 = !DILocation(line: 42, column: 31, scope: !56)
!80 = !DILocation(line: 42, column: 13, scope: !56)
!81 = !DILocation(line: 45, column: 1, scope: !11)
!82 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_17_good", scope: !12, file: !12, line: 77, type: !13, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 79, column: 5, scope: !82)
!84 = !DILocation(line: 80, column: 1, scope: !82)
!85 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 92, type: !86, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!16, !16, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !12, line: 92, type: !16)
!92 = !DILocation(line: 92, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !12, line: 92, type: !88)
!94 = !DILocation(line: 92, column: 27, scope: !85)
!95 = !DILocation(line: 95, column: 22, scope: !85)
!96 = !DILocation(line: 95, column: 12, scope: !85)
!97 = !DILocation(line: 95, column: 5, scope: !85)
!98 = !DILocation(line: 97, column: 5, scope: !85)
!99 = !DILocation(line: 98, column: 5, scope: !85)
!100 = !DILocation(line: 99, column: 5, scope: !85)
!101 = !DILocation(line: 102, column: 5, scope: !85)
!102 = !DILocation(line: 103, column: 5, scope: !85)
!103 = !DILocation(line: 104, column: 5, scope: !85)
!104 = !DILocation(line: 106, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "h", scope: !105, file: !12, line: 54, type: !16)
!107 = !DILocation(line: 54, column: 9, scope: !105)
!108 = !DILocalVariable(name: "data", scope: !105, file: !12, line: 55, type: !19)
!109 = !DILocation(line: 55, column: 15, scope: !105)
!110 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !12, line: 56, type: !27)
!111 = !DILocation(line: 56, column: 13, scope: !105)
!112 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !12, line: 57, type: !32)
!113 = !DILocation(line: 57, column: 13, scope: !105)
!114 = !DILocation(line: 58, column: 11, scope: !115)
!115 = distinct !DILexicalBlock(scope: !105, file: !12, line: 58, column: 5)
!116 = !DILocation(line: 58, column: 9, scope: !115)
!117 = !DILocation(line: 58, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !12, line: 58, column: 5)
!119 = !DILocation(line: 58, column: 18, scope: !118)
!120 = !DILocation(line: 58, column: 5, scope: !115)
!121 = !DILocation(line: 61, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !12, line: 59, column: 5)
!123 = !DILocation(line: 61, column: 14, scope: !122)
!124 = !DILocation(line: 62, column: 5, scope: !122)
!125 = !DILocation(line: 58, column: 24, scope: !118)
!126 = !DILocation(line: 58, column: 5, scope: !118)
!127 = distinct !{!127, !120, !128, !51}
!128 = !DILocation(line: 62, column: 5, scope: !115)
!129 = !DILocalVariable(name: "source", scope: !130, file: !12, line: 64, type: !32)
!130 = distinct !DILexicalBlock(scope: !105, file: !12, line: 63, column: 5)
!131 = !DILocation(line: 64, column: 17, scope: !130)
!132 = !DILocalVariable(name: "i", scope: !133, file: !12, line: 66, type: !57)
!133 = distinct !DILexicalBlock(scope: !130, file: !12, line: 65, column: 9)
!134 = !DILocation(line: 66, column: 20, scope: !133)
!135 = !DILocation(line: 68, column: 20, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !12, line: 68, column: 13)
!137 = !DILocation(line: 68, column: 18, scope: !136)
!138 = !DILocation(line: 68, column: 25, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !12, line: 68, column: 13)
!140 = !DILocation(line: 68, column: 27, scope: !139)
!141 = !DILocation(line: 68, column: 13, scope: !136)
!142 = !DILocation(line: 70, column: 34, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !12, line: 69, column: 13)
!144 = !DILocation(line: 70, column: 27, scope: !143)
!145 = !DILocation(line: 70, column: 17, scope: !143)
!146 = !DILocation(line: 70, column: 22, scope: !143)
!147 = !DILocation(line: 70, column: 25, scope: !143)
!148 = !DILocation(line: 71, column: 13, scope: !143)
!149 = !DILocation(line: 68, column: 35, scope: !139)
!150 = !DILocation(line: 68, column: 13, scope: !139)
!151 = distinct !{!151, !141, !152, !51}
!152 = !DILocation(line: 71, column: 13, scope: !136)
!153 = !DILocation(line: 72, column: 31, scope: !133)
!154 = !DILocation(line: 72, column: 13, scope: !133)
!155 = !DILocation(line: 75, column: 1, scope: !105)
