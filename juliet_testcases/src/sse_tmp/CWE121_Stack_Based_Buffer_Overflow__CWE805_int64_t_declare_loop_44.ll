; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_44_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %funcPtr = alloca void (i64*)*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !15, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata void (i64*)** %funcPtr, metadata !23, metadata !DIExpression()), !dbg !27
  store void (i64*)* @badSink, void (i64*)** %funcPtr, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !33, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i64* %arraydecay, i64** %data, align 8, !dbg !39
  %0 = load void (i64*)*, void (i64*)** %funcPtr, align 8, !dbg !40
  %1 = load i64*, i64** %data, align 8, !dbg !41
  call void %0(i64* %1), !dbg !40
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i64* %data) #0 !dbg !43 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !46, metadata !DIExpression()), !dbg !48
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !58
  %cmp = icmp ult i64 %1, 100, !dbg !60
  br i1 %cmp, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !64
  %3 = load i64, i64* %arrayidx, align 8, !dbg !64
  %4 = load i64*, i64** %data.addr, align 8, !dbg !65
  %5 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !65
  store i64 %3, i64* %arrayidx1, align 8, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %6, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data.addr, align 8, !dbg !74
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !74
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !74
  call void @printLongLongLine(i64 %8), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_44_good() #0 !dbg !77 {
entry:
  call void @goodG2B(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* null) #5, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #5, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_44_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_44_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !101 {
entry:
  %data = alloca i64*, align 8
  %funcPtr = alloca void (i64*)*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata void (i64*)** %funcPtr, metadata !104, metadata !DIExpression()), !dbg !105
  store void (i64*)* @goodG2BSink, void (i64*)** %funcPtr, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !110
  store i64* %arraydecay, i64** %data, align 8, !dbg !111
  %0 = load void (i64*)*, void (i64*)** %funcPtr, align 8, !dbg !112
  %1 = load i64*, i64** %data, align 8, !dbg !113
  call void %0(i64* %1), !dbg !112
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i64* %data) #0 !dbg !115 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !118, metadata !DIExpression()), !dbg !120
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !120
  call void @llvm.dbg.declare(metadata i64* %i, metadata !121, metadata !DIExpression()), !dbg !123
  store i64 0, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !126

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !127
  %cmp = icmp ult i64 %1, 100, !dbg !129
  br i1 %cmp, label %for.body, label %for.end, !dbg !130

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !133
  %3 = load i64, i64* %arrayidx, align 8, !dbg !133
  %4 = load i64*, i64** %data.addr, align 8, !dbg !134
  %5 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !134
  store i64 %3, i64* %arrayidx1, align 8, !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !138
  %inc = add i64 %6, 1, !dbg !138
  store i64 %inc, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data.addr, align 8, !dbg !142
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !142
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !142
  call void @printLongLongLine(i64 %8), !dbg !143
  ret void, !dbg !144
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_44.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_44_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_44.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !18, line: 27, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !20, line: 43, baseType: !21)
!20 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!21 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!22 = !DILocation(line: 39, column: 15, scope: !11)
!23 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 41, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DISubroutineType(types: !26)
!26 = !{null, !16}
!27 = !DILocation(line: 41, column: 12, scope: !11)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 42, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 50)
!32 = !DILocation(line: 42, column: 13, scope: !11)
!33 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 43, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 43, column: 13, scope: !11)
!38 = !DILocation(line: 46, column: 12, scope: !11)
!39 = !DILocation(line: 46, column: 10, scope: !11)
!40 = !DILocation(line: 48, column: 5, scope: !11)
!41 = !DILocation(line: 48, column: 13, scope: !11)
!42 = !DILocation(line: 49, column: 1, scope: !11)
!43 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 21, type: !25, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocalVariable(name: "data", arg: 1, scope: !43, file: !12, line: 21, type: !16)
!45 = !DILocation(line: 21, column: 31, scope: !43)
!46 = !DILocalVariable(name: "source", scope: !47, file: !12, line: 24, type: !34)
!47 = distinct !DILexicalBlock(scope: !43, file: !12, line: 23, column: 5)
!48 = !DILocation(line: 24, column: 17, scope: !47)
!49 = !DILocalVariable(name: "i", scope: !50, file: !12, line: 26, type: !51)
!50 = distinct !DILexicalBlock(scope: !47, file: !12, line: 25, column: 9)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !52, line: 46, baseType: !53)
!52 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!53 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 26, column: 20, scope: !50)
!55 = !DILocation(line: 28, column: 20, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !12, line: 28, column: 13)
!57 = !DILocation(line: 28, column: 18, scope: !56)
!58 = !DILocation(line: 28, column: 25, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !12, line: 28, column: 13)
!60 = !DILocation(line: 28, column: 27, scope: !59)
!61 = !DILocation(line: 28, column: 13, scope: !56)
!62 = !DILocation(line: 30, column: 34, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !12, line: 29, column: 13)
!64 = !DILocation(line: 30, column: 27, scope: !63)
!65 = !DILocation(line: 30, column: 17, scope: !63)
!66 = !DILocation(line: 30, column: 22, scope: !63)
!67 = !DILocation(line: 30, column: 25, scope: !63)
!68 = !DILocation(line: 31, column: 13, scope: !63)
!69 = !DILocation(line: 28, column: 35, scope: !59)
!70 = !DILocation(line: 28, column: 13, scope: !59)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 31, column: 13, scope: !56)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 32, column: 31, scope: !50)
!75 = !DILocation(line: 32, column: 13, scope: !50)
!76 = !DILocation(line: 35, column: 1, scope: !43)
!77 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_44_good", scope: !12, file: !12, line: 83, type: !13, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocation(line: 85, column: 5, scope: !77)
!79 = !DILocation(line: 86, column: 1, scope: !77)
!80 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 97, type: !81, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!83, !83, !84}
!83 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !12, line: 97, type: !83)
!88 = !DILocation(line: 97, column: 14, scope: !80)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !12, line: 97, type: !84)
!90 = !DILocation(line: 97, column: 27, scope: !80)
!91 = !DILocation(line: 100, column: 22, scope: !80)
!92 = !DILocation(line: 100, column: 12, scope: !80)
!93 = !DILocation(line: 100, column: 5, scope: !80)
!94 = !DILocation(line: 102, column: 5, scope: !80)
!95 = !DILocation(line: 103, column: 5, scope: !80)
!96 = !DILocation(line: 104, column: 5, scope: !80)
!97 = !DILocation(line: 107, column: 5, scope: !80)
!98 = !DILocation(line: 108, column: 5, scope: !80)
!99 = !DILocation(line: 109, column: 5, scope: !80)
!100 = !DILocation(line: 111, column: 5, scope: !80)
!101 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 72, type: !13, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !12, line: 74, type: !16)
!103 = !DILocation(line: 74, column: 15, scope: !101)
!104 = !DILocalVariable(name: "funcPtr", scope: !101, file: !12, line: 75, type: !24)
!105 = !DILocation(line: 75, column: 12, scope: !101)
!106 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !12, line: 76, type: !29)
!107 = !DILocation(line: 76, column: 13, scope: !101)
!108 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !12, line: 77, type: !34)
!109 = !DILocation(line: 77, column: 13, scope: !101)
!110 = !DILocation(line: 79, column: 12, scope: !101)
!111 = !DILocation(line: 79, column: 10, scope: !101)
!112 = !DILocation(line: 80, column: 5, scope: !101)
!113 = !DILocation(line: 80, column: 13, scope: !101)
!114 = !DILocation(line: 81, column: 1, scope: !101)
!115 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 56, type: !25, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocalVariable(name: "data", arg: 1, scope: !115, file: !12, line: 56, type: !16)
!117 = !DILocation(line: 56, column: 35, scope: !115)
!118 = !DILocalVariable(name: "source", scope: !119, file: !12, line: 59, type: !34)
!119 = distinct !DILexicalBlock(scope: !115, file: !12, line: 58, column: 5)
!120 = !DILocation(line: 59, column: 17, scope: !119)
!121 = !DILocalVariable(name: "i", scope: !122, file: !12, line: 61, type: !51)
!122 = distinct !DILexicalBlock(scope: !119, file: !12, line: 60, column: 9)
!123 = !DILocation(line: 61, column: 20, scope: !122)
!124 = !DILocation(line: 63, column: 20, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !12, line: 63, column: 13)
!126 = !DILocation(line: 63, column: 18, scope: !125)
!127 = !DILocation(line: 63, column: 25, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !12, line: 63, column: 13)
!129 = !DILocation(line: 63, column: 27, scope: !128)
!130 = !DILocation(line: 63, column: 13, scope: !125)
!131 = !DILocation(line: 65, column: 34, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !12, line: 64, column: 13)
!133 = !DILocation(line: 65, column: 27, scope: !132)
!134 = !DILocation(line: 65, column: 17, scope: !132)
!135 = !DILocation(line: 65, column: 22, scope: !132)
!136 = !DILocation(line: 65, column: 25, scope: !132)
!137 = !DILocation(line: 66, column: 13, scope: !132)
!138 = !DILocation(line: 63, column: 35, scope: !128)
!139 = !DILocation(line: 63, column: 13, scope: !128)
!140 = distinct !{!140, !130, !141, !73}
!141 = !DILocation(line: 66, column: 13, scope: !125)
!142 = !DILocation(line: 67, column: 31, scope: !122)
!143 = !DILocation(line: 67, column: 13, scope: !122)
!144 = !DILocation(line: 70, column: 1, scope: !115)
