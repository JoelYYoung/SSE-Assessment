; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_44_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !35
  %0 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !36
  %1 = load i32*, i32** %data, align 8, !dbg !37
  call void %0(i32* %1), !dbg !36
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !39 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !42, metadata !DIExpression()), !dbg !44
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !54
  %cmp = icmp ult i64 %1, 100, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !60
  %3 = load i32, i32* %arrayidx, align 4, !dbg !60
  %4 = load i32*, i32** %data.addr, align 8, !dbg !61
  %5 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !61
  store i32 %3, i32* %arrayidx1, align 4, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %6, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data.addr, align 8, !dbg !70
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !70
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !70
  call void @printIntLine(i32 %8), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_44_good() #0 !dbg !73 {
entry:
  call void @goodG2B(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* null) #5, !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 %conv) #5, !dbg !88
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_44_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_44_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !96 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !99, metadata !DIExpression()), !dbg !100
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !105
  store i32* %arraydecay, i32** %data, align 8, !dbg !106
  %0 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !107
  %1 = load i32*, i32** %data, align 8, !dbg !108
  call void %0(i32* %1), !dbg !107
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !110 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !113, metadata !DIExpression()), !dbg !115
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !115
  call void @llvm.dbg.declare(metadata i64* %i, metadata !116, metadata !DIExpression()), !dbg !118
  store i64 0, i64* %i, align 8, !dbg !119
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !122
  %cmp = icmp ult i64 %1, 100, !dbg !124
  br i1 %cmp, label %for.body, label %for.end, !dbg !125

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !126
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !128
  %3 = load i32, i32* %arrayidx, align 4, !dbg !128
  %4 = load i32*, i32** %data.addr, align 8, !dbg !129
  %5 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !129
  store i32 %3, i32* %arrayidx1, align 4, !dbg !131
  br label %for.inc, !dbg !132

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !133
  %inc = add i64 %6, 1, !dbg !133
  store i64 %inc, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !134, !llvm.loop !135

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data.addr, align 8, !dbg !137
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !137
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !137
  call void @printIntLine(i32 %8), !dbg !138
  ret void, !dbg !139
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_44.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_44_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_44.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 39, column: 11, scope: !11)
!19 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 41, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !16}
!23 = !DILocation(line: 41, column: 12, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 42, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 42, column: 9, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 43, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 43, column: 9, scope: !11)
!34 = !DILocation(line: 46, column: 12, scope: !11)
!35 = !DILocation(line: 46, column: 10, scope: !11)
!36 = !DILocation(line: 48, column: 5, scope: !11)
!37 = !DILocation(line: 48, column: 13, scope: !11)
!38 = !DILocation(line: 49, column: 1, scope: !11)
!39 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 21, type: !21, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocalVariable(name: "data", arg: 1, scope: !39, file: !12, line: 21, type: !16)
!41 = !DILocation(line: 21, column: 27, scope: !39)
!42 = !DILocalVariable(name: "source", scope: !43, file: !12, line: 24, type: !30)
!43 = distinct !DILexicalBlock(scope: !39, file: !12, line: 23, column: 5)
!44 = !DILocation(line: 24, column: 13, scope: !43)
!45 = !DILocalVariable(name: "i", scope: !46, file: !12, line: 26, type: !47)
!46 = distinct !DILexicalBlock(scope: !43, file: !12, line: 25, column: 9)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 46, baseType: !49)
!48 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 26, column: 20, scope: !46)
!51 = !DILocation(line: 28, column: 20, scope: !52)
!52 = distinct !DILexicalBlock(scope: !46, file: !12, line: 28, column: 13)
!53 = !DILocation(line: 28, column: 18, scope: !52)
!54 = !DILocation(line: 28, column: 25, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !12, line: 28, column: 13)
!56 = !DILocation(line: 28, column: 27, scope: !55)
!57 = !DILocation(line: 28, column: 13, scope: !52)
!58 = !DILocation(line: 30, column: 34, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !12, line: 29, column: 13)
!60 = !DILocation(line: 30, column: 27, scope: !59)
!61 = !DILocation(line: 30, column: 17, scope: !59)
!62 = !DILocation(line: 30, column: 22, scope: !59)
!63 = !DILocation(line: 30, column: 25, scope: !59)
!64 = !DILocation(line: 31, column: 13, scope: !59)
!65 = !DILocation(line: 28, column: 35, scope: !55)
!66 = !DILocation(line: 28, column: 13, scope: !55)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 31, column: 13, scope: !52)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 32, column: 26, scope: !46)
!71 = !DILocation(line: 32, column: 13, scope: !46)
!72 = !DILocation(line: 35, column: 1, scope: !39)
!73 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_44_good", scope: !12, file: !12, line: 83, type: !13, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 85, column: 5, scope: !73)
!75 = !DILocation(line: 86, column: 1, scope: !73)
!76 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 97, type: !77, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!17, !17, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !12, line: 97, type: !17)
!83 = !DILocation(line: 97, column: 14, scope: !76)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !12, line: 97, type: !79)
!85 = !DILocation(line: 97, column: 27, scope: !76)
!86 = !DILocation(line: 100, column: 22, scope: !76)
!87 = !DILocation(line: 100, column: 12, scope: !76)
!88 = !DILocation(line: 100, column: 5, scope: !76)
!89 = !DILocation(line: 102, column: 5, scope: !76)
!90 = !DILocation(line: 103, column: 5, scope: !76)
!91 = !DILocation(line: 104, column: 5, scope: !76)
!92 = !DILocation(line: 107, column: 5, scope: !76)
!93 = !DILocation(line: 108, column: 5, scope: !76)
!94 = !DILocation(line: 109, column: 5, scope: !76)
!95 = !DILocation(line: 111, column: 5, scope: !76)
!96 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 72, type: !13, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !12, line: 74, type: !16)
!98 = !DILocation(line: 74, column: 11, scope: !96)
!99 = !DILocalVariable(name: "funcPtr", scope: !96, file: !12, line: 75, type: !20)
!100 = !DILocation(line: 75, column: 12, scope: !96)
!101 = !DILocalVariable(name: "dataBadBuffer", scope: !96, file: !12, line: 76, type: !25)
!102 = !DILocation(line: 76, column: 9, scope: !96)
!103 = !DILocalVariable(name: "dataGoodBuffer", scope: !96, file: !12, line: 77, type: !30)
!104 = !DILocation(line: 77, column: 9, scope: !96)
!105 = !DILocation(line: 79, column: 12, scope: !96)
!106 = !DILocation(line: 79, column: 10, scope: !96)
!107 = !DILocation(line: 80, column: 5, scope: !96)
!108 = !DILocation(line: 80, column: 13, scope: !96)
!109 = !DILocation(line: 81, column: 1, scope: !96)
!110 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 56, type: !21, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocalVariable(name: "data", arg: 1, scope: !110, file: !12, line: 56, type: !16)
!112 = !DILocation(line: 56, column: 31, scope: !110)
!113 = !DILocalVariable(name: "source", scope: !114, file: !12, line: 59, type: !30)
!114 = distinct !DILexicalBlock(scope: !110, file: !12, line: 58, column: 5)
!115 = !DILocation(line: 59, column: 13, scope: !114)
!116 = !DILocalVariable(name: "i", scope: !117, file: !12, line: 61, type: !47)
!117 = distinct !DILexicalBlock(scope: !114, file: !12, line: 60, column: 9)
!118 = !DILocation(line: 61, column: 20, scope: !117)
!119 = !DILocation(line: 63, column: 20, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !12, line: 63, column: 13)
!121 = !DILocation(line: 63, column: 18, scope: !120)
!122 = !DILocation(line: 63, column: 25, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !12, line: 63, column: 13)
!124 = !DILocation(line: 63, column: 27, scope: !123)
!125 = !DILocation(line: 63, column: 13, scope: !120)
!126 = !DILocation(line: 65, column: 34, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !12, line: 64, column: 13)
!128 = !DILocation(line: 65, column: 27, scope: !127)
!129 = !DILocation(line: 65, column: 17, scope: !127)
!130 = !DILocation(line: 65, column: 22, scope: !127)
!131 = !DILocation(line: 65, column: 25, scope: !127)
!132 = !DILocation(line: 66, column: 13, scope: !127)
!133 = !DILocation(line: 63, column: 35, scope: !123)
!134 = !DILocation(line: 63, column: 13, scope: !123)
!135 = distinct !{!135, !125, !136, !69}
!136 = !DILocation(line: 66, column: 13, scope: !120)
!137 = !DILocation(line: 67, column: 26, scope: !117)
!138 = !DILocation(line: 67, column: 13, scope: !117)
!139 = !DILocation(line: 70, column: 1, scope: !110)
