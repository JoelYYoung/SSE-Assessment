; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_44_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i8* %arraydecay, i8** %data, align 8, !dbg !35
  %0 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  %1 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !38
  %2 = load i8*, i8** %data, align 8, !dbg !39
  call void %1(i8* %2), !dbg !38
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !41 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !50, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !52
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !53
  store i8 0, i8* %arrayidx, align 1, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !58
  %cmp = icmp ult i64 %0, 100, !dbg !60
  br i1 %cmp, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %1, !dbg !64
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !64
  %3 = load i8*, i8** %data.addr, align 8, !dbg !65
  %4 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !65
  store i8 %2, i8* %arrayidx2, align 1, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %5, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %6 = load i8*, i8** %data.addr, align 8, !dbg !74
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !74
  store i8 0, i8* %arrayidx3, align 1, !dbg !75
  %7 = load i8*, i8** %data.addr, align 8, !dbg !76
  call void @printLine(i8* %7), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_44_good() #0 !dbg !79 {
entry:
  call void @goodG2B(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !82 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_44_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_44_bad(), !dbg !98
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

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !101 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !104, metadata !DIExpression()), !dbg !105
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !110
  store i8* %arraydecay, i8** %data, align 8, !dbg !111
  %0 = load i8*, i8** %data, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !112
  store i8 0, i8* %arrayidx, align 1, !dbg !113
  %1 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !114
  %2 = load i8*, i8** %data, align 8, !dbg !115
  call void %1(i8* %2), !dbg !114
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !117 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i64* %i, metadata !120, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !123, metadata !DIExpression()), !dbg !124
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !125
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !126
  store i8 0, i8* %arrayidx, align 1, !dbg !127
  store i64 0, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !130

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !131
  %cmp = icmp ult i64 %0, 100, !dbg !133
  br i1 %cmp, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %1, !dbg !137
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !137
  %3 = load i8*, i8** %data.addr, align 8, !dbg !138
  %4 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !138
  store i8 %2, i8* %arrayidx2, align 1, !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !142
  %inc = add i64 %5, 1, !dbg !142
  store i64 %inc, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %for.cond
  %6 = load i8*, i8** %data.addr, align 8, !dbg !146
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !146
  store i8 0, i8* %arrayidx3, align 1, !dbg !147
  %7 = load i8*, i8** %data.addr, align 8, !dbg !148
  call void @printLine(i8* %7), !dbg !149
  ret void, !dbg !150
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_44_bad", scope: !12, file: !12, line: 40, type: !13, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 42, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 42, column: 12, scope: !11)
!19 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 44, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !16}
!23 = !DILocation(line: 44, column: 12, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 45, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 45, column: 10, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 46, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 46, column: 10, scope: !11)
!34 = !DILocation(line: 49, column: 12, scope: !11)
!35 = !DILocation(line: 49, column: 10, scope: !11)
!36 = !DILocation(line: 50, column: 5, scope: !11)
!37 = !DILocation(line: 50, column: 13, scope: !11)
!38 = !DILocation(line: 52, column: 5, scope: !11)
!39 = !DILocation(line: 52, column: 13, scope: !11)
!40 = !DILocation(line: 53, column: 1, scope: !11)
!41 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 23, type: !21, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocalVariable(name: "data", arg: 1, scope: !41, file: !12, line: 23, type: !16)
!43 = !DILocation(line: 23, column: 28, scope: !41)
!44 = !DILocalVariable(name: "i", scope: !45, file: !12, line: 26, type: !46)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 25, column: 5)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 46, baseType: !48)
!47 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 26, column: 16, scope: !45)
!50 = !DILocalVariable(name: "source", scope: !45, file: !12, line: 27, type: !30)
!51 = !DILocation(line: 27, column: 14, scope: !45)
!52 = !DILocation(line: 28, column: 9, scope: !45)
!53 = !DILocation(line: 29, column: 9, scope: !45)
!54 = !DILocation(line: 29, column: 23, scope: !45)
!55 = !DILocation(line: 31, column: 16, scope: !56)
!56 = distinct !DILexicalBlock(scope: !45, file: !12, line: 31, column: 9)
!57 = !DILocation(line: 31, column: 14, scope: !56)
!58 = !DILocation(line: 31, column: 21, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !12, line: 31, column: 9)
!60 = !DILocation(line: 31, column: 23, scope: !59)
!61 = !DILocation(line: 31, column: 9, scope: !56)
!62 = !DILocation(line: 33, column: 30, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !12, line: 32, column: 9)
!64 = !DILocation(line: 33, column: 23, scope: !63)
!65 = !DILocation(line: 33, column: 13, scope: !63)
!66 = !DILocation(line: 33, column: 18, scope: !63)
!67 = !DILocation(line: 33, column: 21, scope: !63)
!68 = !DILocation(line: 34, column: 9, scope: !63)
!69 = !DILocation(line: 31, column: 31, scope: !59)
!70 = !DILocation(line: 31, column: 9, scope: !59)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 34, column: 9, scope: !56)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 35, column: 9, scope: !45)
!75 = !DILocation(line: 35, column: 21, scope: !45)
!76 = !DILocation(line: 36, column: 19, scope: !45)
!77 = !DILocation(line: 36, column: 9, scope: !45)
!78 = !DILocation(line: 38, column: 1, scope: !41)
!79 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_44_good", scope: !12, file: !12, line: 89, type: !13, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 91, column: 5, scope: !79)
!81 = !DILocation(line: 92, column: 1, scope: !79)
!82 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 103, type: !83, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DISubroutineType(types: !84)
!84 = !{!85, !85, !86}
!85 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !12, line: 103, type: !85)
!88 = !DILocation(line: 103, column: 14, scope: !82)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !12, line: 103, type: !86)
!90 = !DILocation(line: 103, column: 27, scope: !82)
!91 = !DILocation(line: 106, column: 22, scope: !82)
!92 = !DILocation(line: 106, column: 12, scope: !82)
!93 = !DILocation(line: 106, column: 5, scope: !82)
!94 = !DILocation(line: 108, column: 5, scope: !82)
!95 = !DILocation(line: 109, column: 5, scope: !82)
!96 = !DILocation(line: 110, column: 5, scope: !82)
!97 = !DILocation(line: 113, column: 5, scope: !82)
!98 = !DILocation(line: 114, column: 5, scope: !82)
!99 = !DILocation(line: 115, column: 5, scope: !82)
!100 = !DILocation(line: 117, column: 5, scope: !82)
!101 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 77, type: !13, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !12, line: 79, type: !16)
!103 = !DILocation(line: 79, column: 12, scope: !101)
!104 = !DILocalVariable(name: "funcPtr", scope: !101, file: !12, line: 80, type: !20)
!105 = !DILocation(line: 80, column: 12, scope: !101)
!106 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !12, line: 81, type: !25)
!107 = !DILocation(line: 81, column: 10, scope: !101)
!108 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !12, line: 82, type: !30)
!109 = !DILocation(line: 82, column: 10, scope: !101)
!110 = !DILocation(line: 84, column: 12, scope: !101)
!111 = !DILocation(line: 84, column: 10, scope: !101)
!112 = !DILocation(line: 85, column: 5, scope: !101)
!113 = !DILocation(line: 85, column: 13, scope: !101)
!114 = !DILocation(line: 86, column: 5, scope: !101)
!115 = !DILocation(line: 86, column: 13, scope: !101)
!116 = !DILocation(line: 87, column: 1, scope: !101)
!117 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 60, type: !21, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DILocalVariable(name: "data", arg: 1, scope: !117, file: !12, line: 60, type: !16)
!119 = !DILocation(line: 60, column: 32, scope: !117)
!120 = !DILocalVariable(name: "i", scope: !121, file: !12, line: 63, type: !46)
!121 = distinct !DILexicalBlock(scope: !117, file: !12, line: 62, column: 5)
!122 = !DILocation(line: 63, column: 16, scope: !121)
!123 = !DILocalVariable(name: "source", scope: !121, file: !12, line: 64, type: !30)
!124 = !DILocation(line: 64, column: 14, scope: !121)
!125 = !DILocation(line: 65, column: 9, scope: !121)
!126 = !DILocation(line: 66, column: 9, scope: !121)
!127 = !DILocation(line: 66, column: 23, scope: !121)
!128 = !DILocation(line: 68, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !121, file: !12, line: 68, column: 9)
!130 = !DILocation(line: 68, column: 14, scope: !129)
!131 = !DILocation(line: 68, column: 21, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !12, line: 68, column: 9)
!133 = !DILocation(line: 68, column: 23, scope: !132)
!134 = !DILocation(line: 68, column: 9, scope: !129)
!135 = !DILocation(line: 70, column: 30, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !12, line: 69, column: 9)
!137 = !DILocation(line: 70, column: 23, scope: !136)
!138 = !DILocation(line: 70, column: 13, scope: !136)
!139 = !DILocation(line: 70, column: 18, scope: !136)
!140 = !DILocation(line: 70, column: 21, scope: !136)
!141 = !DILocation(line: 71, column: 9, scope: !136)
!142 = !DILocation(line: 68, column: 31, scope: !132)
!143 = !DILocation(line: 68, column: 9, scope: !132)
!144 = distinct !{!144, !134, !145, !73}
!145 = !DILocation(line: 71, column: 9, scope: !129)
!146 = !DILocation(line: 72, column: 9, scope: !121)
!147 = !DILocation(line: 72, column: 21, scope: !121)
!148 = !DILocation(line: 73, column: 19, scope: !121)
!149 = !DILocation(line: 73, column: 9, scope: !121)
!150 = !DILocation(line: 75, column: 1, scope: !117)
