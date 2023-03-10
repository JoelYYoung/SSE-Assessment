; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_44.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_loop_44_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !29
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !32
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !33
  store i8* %add.ptr, i8** %data, align 8, !dbg !34
  %0 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !35
  %1 = load i8*, i8** %data, align 8, !dbg !36
  call void %0(i8* %1), !dbg !35
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !38 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !47, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !49
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !50
  store i8 0, i8* %arrayidx, align 1, !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !55
  %cmp = icmp ult i64 %0, 100, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %1, !dbg !61
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !61
  %3 = load i8*, i8** %data.addr, align 8, !dbg !62
  %4 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !62
  store i8 %2, i8* %arrayidx2, align 1, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %5, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %6 = load i8*, i8** %data.addr, align 8, !dbg !71
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !71
  store i8 0, i8* %arrayidx3, align 1, !dbg !72
  %7 = load i8*, i8** %data.addr, align 8, !dbg !73
  call void @printLine(i8* %7), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_loop_44_good() #0 !dbg !76 {
entry:
  call void @goodG2B(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #5, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #5, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE124_Buffer_Underwrite__char_declare_loop_44_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE124_Buffer_Underwrite__char_declare_loop_44_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !98 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !101, metadata !DIExpression()), !dbg !102
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !105
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !106
  store i8 0, i8* %arrayidx, align 1, !dbg !107
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !108
  store i8* %arraydecay1, i8** %data, align 8, !dbg !109
  %0 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !110
  %1 = load i8*, i8** %data, align 8, !dbg !111
  call void %0(i8* %1), !dbg !110
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !113 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i64* %i, metadata !116, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !119, metadata !DIExpression()), !dbg !120
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !121
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !122
  store i8 0, i8* %arrayidx, align 1, !dbg !123
  store i64 0, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !126

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !127
  %cmp = icmp ult i64 %0, 100, !dbg !129
  br i1 %cmp, label %for.body, label %for.end, !dbg !130

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %1, !dbg !133
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !133
  %3 = load i8*, i8** %data.addr, align 8, !dbg !134
  %4 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !134
  store i8 %2, i8* %arrayidx2, align 1, !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !138
  %inc = add i64 %5, 1, !dbg !138
  store i64 %inc, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  %6 = load i8*, i8** %data.addr, align 8, !dbg !142
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !142
  store i8 0, i8* %arrayidx3, align 1, !dbg !143
  %7 = load i8*, i8** %data.addr, align 8, !dbg !144
  call void @printLine(i8* %7), !dbg !145
  ret void, !dbg !146
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_loop_44_bad", scope: !12, file: !12, line: 41, type: !13, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 43, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 43, column: 12, scope: !11)
!19 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 45, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !16}
!23 = !DILocation(line: 45, column: 12, scope: !11)
!24 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 46, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 46, column: 10, scope: !11)
!29 = !DILocation(line: 47, column: 5, scope: !11)
!30 = !DILocation(line: 48, column: 5, scope: !11)
!31 = !DILocation(line: 48, column: 23, scope: !11)
!32 = !DILocation(line: 50, column: 12, scope: !11)
!33 = !DILocation(line: 50, column: 23, scope: !11)
!34 = !DILocation(line: 50, column: 10, scope: !11)
!35 = !DILocation(line: 52, column: 5, scope: !11)
!36 = !DILocation(line: 52, column: 13, scope: !11)
!37 = !DILocation(line: 53, column: 1, scope: !11)
!38 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 23, type: !21, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocalVariable(name: "data", arg: 1, scope: !38, file: !12, line: 23, type: !16)
!40 = !DILocation(line: 23, column: 28, scope: !38)
!41 = !DILocalVariable(name: "i", scope: !42, file: !12, line: 26, type: !43)
!42 = distinct !DILexicalBlock(scope: !38, file: !12, line: 25, column: 5)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 46, baseType: !45)
!44 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 26, column: 16, scope: !42)
!47 = !DILocalVariable(name: "source", scope: !42, file: !12, line: 27, type: !25)
!48 = !DILocation(line: 27, column: 14, scope: !42)
!49 = !DILocation(line: 28, column: 9, scope: !42)
!50 = !DILocation(line: 29, column: 9, scope: !42)
!51 = !DILocation(line: 29, column: 23, scope: !42)
!52 = !DILocation(line: 31, column: 16, scope: !53)
!53 = distinct !DILexicalBlock(scope: !42, file: !12, line: 31, column: 9)
!54 = !DILocation(line: 31, column: 14, scope: !53)
!55 = !DILocation(line: 31, column: 21, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !12, line: 31, column: 9)
!57 = !DILocation(line: 31, column: 23, scope: !56)
!58 = !DILocation(line: 31, column: 9, scope: !53)
!59 = !DILocation(line: 33, column: 30, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !12, line: 32, column: 9)
!61 = !DILocation(line: 33, column: 23, scope: !60)
!62 = !DILocation(line: 33, column: 13, scope: !60)
!63 = !DILocation(line: 33, column: 18, scope: !60)
!64 = !DILocation(line: 33, column: 21, scope: !60)
!65 = !DILocation(line: 34, column: 9, scope: !60)
!66 = !DILocation(line: 31, column: 31, scope: !56)
!67 = !DILocation(line: 31, column: 9, scope: !56)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 34, column: 9, scope: !53)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 36, column: 9, scope: !42)
!72 = !DILocation(line: 36, column: 21, scope: !42)
!73 = !DILocation(line: 37, column: 19, scope: !42)
!74 = !DILocation(line: 37, column: 9, scope: !42)
!75 = !DILocation(line: 39, column: 1, scope: !38)
!76 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_loop_44_good", scope: !12, file: !12, line: 90, type: !13, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 92, column: 5, scope: !76)
!78 = !DILocation(line: 93, column: 1, scope: !76)
!79 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 104, type: !80, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!82, !82, !83}
!82 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !12, line: 104, type: !82)
!85 = !DILocation(line: 104, column: 14, scope: !79)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !12, line: 104, type: !83)
!87 = !DILocation(line: 104, column: 27, scope: !79)
!88 = !DILocation(line: 107, column: 22, scope: !79)
!89 = !DILocation(line: 107, column: 12, scope: !79)
!90 = !DILocation(line: 107, column: 5, scope: !79)
!91 = !DILocation(line: 109, column: 5, scope: !79)
!92 = !DILocation(line: 110, column: 5, scope: !79)
!93 = !DILocation(line: 111, column: 5, scope: !79)
!94 = !DILocation(line: 114, column: 5, scope: !79)
!95 = !DILocation(line: 115, column: 5, scope: !79)
!96 = !DILocation(line: 116, column: 5, scope: !79)
!97 = !DILocation(line: 118, column: 5, scope: !79)
!98 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 78, type: !13, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !12, line: 80, type: !16)
!100 = !DILocation(line: 80, column: 12, scope: !98)
!101 = !DILocalVariable(name: "funcPtr", scope: !98, file: !12, line: 81, type: !20)
!102 = !DILocation(line: 81, column: 12, scope: !98)
!103 = !DILocalVariable(name: "dataBuffer", scope: !98, file: !12, line: 82, type: !25)
!104 = !DILocation(line: 82, column: 10, scope: !98)
!105 = !DILocation(line: 83, column: 5, scope: !98)
!106 = !DILocation(line: 84, column: 5, scope: !98)
!107 = !DILocation(line: 84, column: 23, scope: !98)
!108 = !DILocation(line: 86, column: 12, scope: !98)
!109 = !DILocation(line: 86, column: 10, scope: !98)
!110 = !DILocation(line: 87, column: 5, scope: !98)
!111 = !DILocation(line: 87, column: 13, scope: !98)
!112 = !DILocation(line: 88, column: 1, scope: !98)
!113 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 60, type: !21, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "data", arg: 1, scope: !113, file: !12, line: 60, type: !16)
!115 = !DILocation(line: 60, column: 32, scope: !113)
!116 = !DILocalVariable(name: "i", scope: !117, file: !12, line: 63, type: !43)
!117 = distinct !DILexicalBlock(scope: !113, file: !12, line: 62, column: 5)
!118 = !DILocation(line: 63, column: 16, scope: !117)
!119 = !DILocalVariable(name: "source", scope: !117, file: !12, line: 64, type: !25)
!120 = !DILocation(line: 64, column: 14, scope: !117)
!121 = !DILocation(line: 65, column: 9, scope: !117)
!122 = !DILocation(line: 66, column: 9, scope: !117)
!123 = !DILocation(line: 66, column: 23, scope: !117)
!124 = !DILocation(line: 68, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !117, file: !12, line: 68, column: 9)
!126 = !DILocation(line: 68, column: 14, scope: !125)
!127 = !DILocation(line: 68, column: 21, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !12, line: 68, column: 9)
!129 = !DILocation(line: 68, column: 23, scope: !128)
!130 = !DILocation(line: 68, column: 9, scope: !125)
!131 = !DILocation(line: 70, column: 30, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !12, line: 69, column: 9)
!133 = !DILocation(line: 70, column: 23, scope: !132)
!134 = !DILocation(line: 70, column: 13, scope: !132)
!135 = !DILocation(line: 70, column: 18, scope: !132)
!136 = !DILocation(line: 70, column: 21, scope: !132)
!137 = !DILocation(line: 71, column: 9, scope: !132)
!138 = !DILocation(line: 68, column: 31, scope: !128)
!139 = !DILocation(line: 68, column: 9, scope: !128)
!140 = distinct !{!140, !130, !141, !70}
!141 = !DILocation(line: 71, column: 9, scope: !125)
!142 = !DILocation(line: 73, column: 9, scope: !117)
!143 = !DILocation(line: 73, column: 21, scope: !117)
!144 = !DILocation(line: 74, column: 19, scope: !117)
!145 = !DILocation(line: 74, column: 9, scope: !117)
!146 = !DILocation(line: 76, column: 1, scope: !113)
