; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_12.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_loop_12_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !24
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !25
  store i8 0, i8* %arrayidx, align 1, !dbg !26
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.else, !dbg !29

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !30
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !32
  store i8* %add.ptr, i8** %data, align 8, !dbg !33
  br label %if.end, !dbg !34

if.else:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !35
  store i8* %arraydecay2, i8** %data, align 8, !dbg !37
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !44, metadata !DIExpression()), !dbg !45
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay3, i8 67, i64 99, i1 false), !dbg !46
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx4, align 1, !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !52
  %cmp = icmp ult i64 %0, 100, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %1, !dbg !58
  %2 = load i8, i8* %arrayidx5, align 1, !dbg !58
  %3 = load i8*, i8** %data, align 8, !dbg !59
  %4 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx6 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !59
  store i8 %2, i8* %arrayidx6, align 1, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %5, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !68
  %arrayidx7 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !68
  store i8 0, i8* %arrayidx7, align 1, !dbg !69
  %7 = load i8*, i8** %data, align 8, !dbg !70
  call void @printLine(i8* %7), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i32 @globalReturnsTrueOrFalse(...) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_loop_12_good() #0 !dbg !73 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #5, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #5, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE124_Buffer_Underwrite__char_declare_loop_12_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE124_Buffer_Underwrite__char_declare_loop_12_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !95 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !100
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !101
  store i8 0, i8* %arrayidx, align 1, !dbg !102
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !103
  %tobool = icmp ne i32 %call, 0, !dbg !103
  br i1 %tobool, label %if.then, label %if.else, !dbg !105

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !106
  store i8* %arraydecay1, i8** %data, align 8, !dbg !108
  br label %if.end, !dbg !109

if.else:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !110
  store i8* %arraydecay2, i8** %data, align 8, !dbg !112
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !113, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !116, metadata !DIExpression()), !dbg !117
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay3, i8 67, i64 99, i1 false), !dbg !118
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !119
  store i8 0, i8* %arrayidx4, align 1, !dbg !120
  store i64 0, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !124
  %cmp = icmp ult i64 %0, 100, !dbg !126
  br i1 %cmp, label %for.body, label %for.end, !dbg !127

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %1, !dbg !130
  %2 = load i8, i8* %arrayidx5, align 1, !dbg !130
  %3 = load i8*, i8** %data, align 8, !dbg !131
  %4 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx6 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !131
  store i8 %2, i8* %arrayidx6, align 1, !dbg !133
  br label %for.inc, !dbg !134

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !135
  %inc = add i64 %5, 1, !dbg !135
  store i64 %inc, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !136, !llvm.loop !137

for.end:                                          ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !139
  %arrayidx7 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !139
  store i8 0, i8* %arrayidx7, align 1, !dbg !140
  %7 = load i8*, i8** %data, align 8, !dbg !141
  call void @printLine(i8* %7), !dbg !142
  ret void, !dbg !143
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_loop_12_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!24 = !DILocation(line: 27, column: 5, scope: !11)
!25 = !DILocation(line: 28, column: 5, scope: !11)
!26 = !DILocation(line: 28, column: 23, scope: !11)
!27 = !DILocation(line: 29, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 8)
!29 = !DILocation(line: 29, column: 8, scope: !11)
!30 = !DILocation(line: 32, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !12, line: 30, column: 5)
!32 = !DILocation(line: 32, column: 27, scope: !31)
!33 = !DILocation(line: 32, column: 14, scope: !31)
!34 = !DILocation(line: 33, column: 5, scope: !31)
!35 = !DILocation(line: 37, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !28, file: !12, line: 35, column: 5)
!37 = !DILocation(line: 37, column: 14, scope: !36)
!38 = !DILocalVariable(name: "i", scope: !39, file: !12, line: 40, type: !40)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 39, column: 5)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 40, column: 16, scope: !39)
!44 = !DILocalVariable(name: "source", scope: !39, file: !12, line: 41, type: !20)
!45 = !DILocation(line: 41, column: 14, scope: !39)
!46 = !DILocation(line: 42, column: 9, scope: !39)
!47 = !DILocation(line: 43, column: 9, scope: !39)
!48 = !DILocation(line: 43, column: 23, scope: !39)
!49 = !DILocation(line: 45, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !39, file: !12, line: 45, column: 9)
!51 = !DILocation(line: 45, column: 14, scope: !50)
!52 = !DILocation(line: 45, column: 21, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !12, line: 45, column: 9)
!54 = !DILocation(line: 45, column: 23, scope: !53)
!55 = !DILocation(line: 45, column: 9, scope: !50)
!56 = !DILocation(line: 47, column: 30, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !12, line: 46, column: 9)
!58 = !DILocation(line: 47, column: 23, scope: !57)
!59 = !DILocation(line: 47, column: 13, scope: !57)
!60 = !DILocation(line: 47, column: 18, scope: !57)
!61 = !DILocation(line: 47, column: 21, scope: !57)
!62 = !DILocation(line: 48, column: 9, scope: !57)
!63 = !DILocation(line: 45, column: 31, scope: !53)
!64 = !DILocation(line: 45, column: 9, scope: !53)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 48, column: 9, scope: !50)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 50, column: 9, scope: !39)
!69 = !DILocation(line: 50, column: 21, scope: !39)
!70 = !DILocation(line: 51, column: 19, scope: !39)
!71 = !DILocation(line: 51, column: 9, scope: !39)
!72 = !DILocation(line: 53, column: 1, scope: !11)
!73 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_loop_12_good", scope: !12, file: !12, line: 93, type: !13, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 95, column: 5, scope: !73)
!75 = !DILocation(line: 96, column: 1, scope: !73)
!76 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 108, type: !77, scopeLine: 109, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!79, !79, !80}
!79 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !12, line: 108, type: !79)
!82 = !DILocation(line: 108, column: 14, scope: !76)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !12, line: 108, type: !80)
!84 = !DILocation(line: 108, column: 27, scope: !76)
!85 = !DILocation(line: 111, column: 22, scope: !76)
!86 = !DILocation(line: 111, column: 12, scope: !76)
!87 = !DILocation(line: 111, column: 5, scope: !76)
!88 = !DILocation(line: 113, column: 5, scope: !76)
!89 = !DILocation(line: 114, column: 5, scope: !76)
!90 = !DILocation(line: 115, column: 5, scope: !76)
!91 = !DILocation(line: 118, column: 5, scope: !76)
!92 = !DILocation(line: 119, column: 5, scope: !76)
!93 = !DILocation(line: 120, column: 5, scope: !76)
!94 = !DILocation(line: 122, column: 5, scope: !76)
!95 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !12, line: 63, type: !16)
!97 = !DILocation(line: 63, column: 12, scope: !95)
!98 = !DILocalVariable(name: "dataBuffer", scope: !95, file: !12, line: 64, type: !20)
!99 = !DILocation(line: 64, column: 10, scope: !95)
!100 = !DILocation(line: 65, column: 5, scope: !95)
!101 = !DILocation(line: 66, column: 5, scope: !95)
!102 = !DILocation(line: 66, column: 23, scope: !95)
!103 = !DILocation(line: 67, column: 8, scope: !104)
!104 = distinct !DILexicalBlock(scope: !95, file: !12, line: 67, column: 8)
!105 = !DILocation(line: 67, column: 8, scope: !95)
!106 = !DILocation(line: 70, column: 16, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !12, line: 68, column: 5)
!108 = !DILocation(line: 70, column: 14, scope: !107)
!109 = !DILocation(line: 71, column: 5, scope: !107)
!110 = !DILocation(line: 75, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !104, file: !12, line: 73, column: 5)
!112 = !DILocation(line: 75, column: 14, scope: !111)
!113 = !DILocalVariable(name: "i", scope: !114, file: !12, line: 78, type: !40)
!114 = distinct !DILexicalBlock(scope: !95, file: !12, line: 77, column: 5)
!115 = !DILocation(line: 78, column: 16, scope: !114)
!116 = !DILocalVariable(name: "source", scope: !114, file: !12, line: 79, type: !20)
!117 = !DILocation(line: 79, column: 14, scope: !114)
!118 = !DILocation(line: 80, column: 9, scope: !114)
!119 = !DILocation(line: 81, column: 9, scope: !114)
!120 = !DILocation(line: 81, column: 23, scope: !114)
!121 = !DILocation(line: 83, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !114, file: !12, line: 83, column: 9)
!123 = !DILocation(line: 83, column: 14, scope: !122)
!124 = !DILocation(line: 83, column: 21, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !12, line: 83, column: 9)
!126 = !DILocation(line: 83, column: 23, scope: !125)
!127 = !DILocation(line: 83, column: 9, scope: !122)
!128 = !DILocation(line: 85, column: 30, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !12, line: 84, column: 9)
!130 = !DILocation(line: 85, column: 23, scope: !129)
!131 = !DILocation(line: 85, column: 13, scope: !129)
!132 = !DILocation(line: 85, column: 18, scope: !129)
!133 = !DILocation(line: 85, column: 21, scope: !129)
!134 = !DILocation(line: 86, column: 9, scope: !129)
!135 = !DILocation(line: 83, column: 31, scope: !125)
!136 = !DILocation(line: 83, column: 9, scope: !125)
!137 = distinct !{!137, !127, !138, !67}
!138 = !DILocation(line: 86, column: 9, scope: !122)
!139 = !DILocation(line: 88, column: 9, scope: !114)
!140 = !DILocation(line: 88, column: 21, scope: !114)
!141 = !DILocation(line: 89, column: 19, scope: !114)
!142 = !DILocation(line: 89, column: 9, scope: !114)
!143 = !DILocation(line: 91, column: 1, scope: !95)
