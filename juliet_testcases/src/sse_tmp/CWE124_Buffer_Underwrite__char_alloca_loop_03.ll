; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_loop_03.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_loop_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_loop_03_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !23
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !24
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !24
  store i8 0, i8* %arrayidx, align 1, !dbg !25
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !26
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !29
  store i8* %add.ptr, i8** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i64* %i, metadata !31, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !37, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !42
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !43
  store i8 0, i8* %arrayidx1, align 1, !dbg !44
  store i64 0, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !48
  %cmp = icmp ult i64 %4, 100, !dbg !50
  br i1 %cmp, label %for.body, label %for.end, !dbg !51

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !54
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !54
  %7 = load i8*, i8** %data, align 8, !dbg !55
  %8 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !55
  store i8 %6, i8* %arrayidx3, align 1, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !59
  %inc = add i64 %9, 1, !dbg !59
  store i64 %inc, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !64
  %arrayidx4 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !64
  store i8 0, i8* %arrayidx4, align 1, !dbg !65
  %11 = load i8*, i8** %data, align 8, !dbg !66
  call void @printLine(i8* %11), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_loop_03_good() #0 !dbg !69 {
entry:
  call void @goodG2B1(), !dbg !70
  call void @goodG2B2(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #5, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #5, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE124_Buffer_Underwrite__char_alloca_loop_03_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE124_Buffer_Underwrite__char_alloca_loop_03_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !92 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %0 = alloca i8, i64 100, align 16, !dbg !97
  store i8* %0, i8** %dataBuffer, align 8, !dbg !96
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !99
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !100
  store i8 0, i8* %arrayidx, align 1, !dbg !101
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !102
  store i8* %3, i8** %data, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i64* %i, metadata !106, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !109, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !111
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !112
  store i8 0, i8* %arrayidx1, align 1, !dbg !113
  store i64 0, i64* %i, align 8, !dbg !114
  br label %for.cond, !dbg !116

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !117
  %cmp = icmp ult i64 %4, 100, !dbg !119
  br i1 %cmp, label %for.body, label %for.end, !dbg !120

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !121
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !123
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !123
  %7 = load i8*, i8** %data, align 8, !dbg !124
  %8 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !124
  store i8 %6, i8* %arrayidx3, align 1, !dbg !126
  br label %for.inc, !dbg !127

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !128
  %inc = add i64 %9, 1, !dbg !128
  store i64 %inc, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !129, !llvm.loop !130

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !132
  %arrayidx4 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !132
  store i8 0, i8* %arrayidx4, align 1, !dbg !133
  %11 = load i8*, i8** %data, align 8, !dbg !134
  call void @printLine(i8* %11), !dbg !135
  ret void, !dbg !136
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !137 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !140, metadata !DIExpression()), !dbg !141
  %0 = alloca i8, i64 100, align 16, !dbg !142
  store i8* %0, i8** %dataBuffer, align 8, !dbg !141
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !143
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !144
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !145
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !145
  store i8 0, i8* %arrayidx, align 1, !dbg !146
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !147
  store i8* %3, i8** %data, align 8, !dbg !150
  call void @llvm.dbg.declare(metadata i64* %i, metadata !151, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !154, metadata !DIExpression()), !dbg !155
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !156
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !156
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !157
  store i8 0, i8* %arrayidx1, align 1, !dbg !158
  store i64 0, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !161

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !162
  %cmp = icmp ult i64 %4, 100, !dbg !164
  br i1 %cmp, label %for.body, label %for.end, !dbg !165

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !166
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !168
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !168
  %7 = load i8*, i8** %data, align 8, !dbg !169
  %8 = load i64, i64* %i, align 8, !dbg !170
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !169
  store i8 %6, i8* %arrayidx3, align 1, !dbg !171
  br label %for.inc, !dbg !172

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !173
  %inc = add i64 %9, 1, !dbg !173
  store i64 %inc, i64* %i, align 8, !dbg !173
  br label %for.cond, !dbg !174, !llvm.loop !175

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !177
  %arrayidx4 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !177
  store i8 0, i8* %arrayidx4, align 1, !dbg !178
  %11 = load i8*, i8** %data, align 8, !dbg !179
  call void @printLine(i8* %11), !dbg !180
  ret void, !dbg !181
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_loop_03.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_loop_03_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_loop_03.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 5, scope: !13)
!24 = !DILocation(line: 28, column: 5, scope: !13)
!25 = !DILocation(line: 28, column: 23, scope: !13)
!26 = !DILocation(line: 32, column: 16, scope: !27)
!27 = distinct !DILexicalBlock(scope: !28, file: !14, line: 30, column: 5)
!28 = distinct !DILexicalBlock(scope: !13, file: !14, line: 29, column: 8)
!29 = !DILocation(line: 32, column: 27, scope: !27)
!30 = !DILocation(line: 32, column: 14, scope: !27)
!31 = !DILocalVariable(name: "i", scope: !32, file: !14, line: 35, type: !33)
!32 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !34, line: 46, baseType: !35)
!34 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!35 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!36 = !DILocation(line: 35, column: 16, scope: !32)
!37 = !DILocalVariable(name: "source", scope: !32, file: !14, line: 36, type: !38)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 36, column: 14, scope: !32)
!42 = !DILocation(line: 37, column: 9, scope: !32)
!43 = !DILocation(line: 38, column: 9, scope: !32)
!44 = !DILocation(line: 38, column: 23, scope: !32)
!45 = !DILocation(line: 40, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !32, file: !14, line: 40, column: 9)
!47 = !DILocation(line: 40, column: 14, scope: !46)
!48 = !DILocation(line: 40, column: 21, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !14, line: 40, column: 9)
!50 = !DILocation(line: 40, column: 23, scope: !49)
!51 = !DILocation(line: 40, column: 9, scope: !46)
!52 = !DILocation(line: 42, column: 30, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !14, line: 41, column: 9)
!54 = !DILocation(line: 42, column: 23, scope: !53)
!55 = !DILocation(line: 42, column: 13, scope: !53)
!56 = !DILocation(line: 42, column: 18, scope: !53)
!57 = !DILocation(line: 42, column: 21, scope: !53)
!58 = !DILocation(line: 43, column: 9, scope: !53)
!59 = !DILocation(line: 40, column: 31, scope: !49)
!60 = !DILocation(line: 40, column: 9, scope: !49)
!61 = distinct !{!61, !51, !62, !63}
!62 = !DILocation(line: 43, column: 9, scope: !46)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 45, column: 9, scope: !32)
!65 = !DILocation(line: 45, column: 21, scope: !32)
!66 = !DILocation(line: 46, column: 19, scope: !32)
!67 = !DILocation(line: 46, column: 9, scope: !32)
!68 = !DILocation(line: 48, column: 1, scope: !13)
!69 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_loop_03_good", scope: !14, file: !14, line: 115, type: !15, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 117, column: 5, scope: !69)
!71 = !DILocation(line: 118, column: 5, scope: !69)
!72 = !DILocation(line: 119, column: 1, scope: !69)
!73 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 131, type: !74, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!76, !76, !77}
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !14, line: 131, type: !76)
!79 = !DILocation(line: 131, column: 14, scope: !73)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !14, line: 131, type: !77)
!81 = !DILocation(line: 131, column: 27, scope: !73)
!82 = !DILocation(line: 134, column: 22, scope: !73)
!83 = !DILocation(line: 134, column: 12, scope: !73)
!84 = !DILocation(line: 134, column: 5, scope: !73)
!85 = !DILocation(line: 136, column: 5, scope: !73)
!86 = !DILocation(line: 137, column: 5, scope: !73)
!87 = !DILocation(line: 138, column: 5, scope: !73)
!88 = !DILocation(line: 141, column: 5, scope: !73)
!89 = !DILocation(line: 142, column: 5, scope: !73)
!90 = !DILocation(line: 143, column: 5, scope: !73)
!91 = !DILocation(line: 145, column: 5, scope: !73)
!92 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 55, type: !15, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !14, line: 57, type: !4)
!94 = !DILocation(line: 57, column: 12, scope: !92)
!95 = !DILocalVariable(name: "dataBuffer", scope: !92, file: !14, line: 58, type: !4)
!96 = !DILocation(line: 58, column: 12, scope: !92)
!97 = !DILocation(line: 58, column: 33, scope: !92)
!98 = !DILocation(line: 59, column: 12, scope: !92)
!99 = !DILocation(line: 59, column: 5, scope: !92)
!100 = !DILocation(line: 60, column: 5, scope: !92)
!101 = !DILocation(line: 60, column: 23, scope: !92)
!102 = !DILocation(line: 69, column: 16, scope: !103)
!103 = distinct !DILexicalBlock(scope: !104, file: !14, line: 67, column: 5)
!104 = distinct !DILexicalBlock(scope: !92, file: !14, line: 61, column: 8)
!105 = !DILocation(line: 69, column: 14, scope: !103)
!106 = !DILocalVariable(name: "i", scope: !107, file: !14, line: 72, type: !33)
!107 = distinct !DILexicalBlock(scope: !92, file: !14, line: 71, column: 5)
!108 = !DILocation(line: 72, column: 16, scope: !107)
!109 = !DILocalVariable(name: "source", scope: !107, file: !14, line: 73, type: !38)
!110 = !DILocation(line: 73, column: 14, scope: !107)
!111 = !DILocation(line: 74, column: 9, scope: !107)
!112 = !DILocation(line: 75, column: 9, scope: !107)
!113 = !DILocation(line: 75, column: 23, scope: !107)
!114 = !DILocation(line: 77, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !107, file: !14, line: 77, column: 9)
!116 = !DILocation(line: 77, column: 14, scope: !115)
!117 = !DILocation(line: 77, column: 21, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !14, line: 77, column: 9)
!119 = !DILocation(line: 77, column: 23, scope: !118)
!120 = !DILocation(line: 77, column: 9, scope: !115)
!121 = !DILocation(line: 79, column: 30, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !14, line: 78, column: 9)
!123 = !DILocation(line: 79, column: 23, scope: !122)
!124 = !DILocation(line: 79, column: 13, scope: !122)
!125 = !DILocation(line: 79, column: 18, scope: !122)
!126 = !DILocation(line: 79, column: 21, scope: !122)
!127 = !DILocation(line: 80, column: 9, scope: !122)
!128 = !DILocation(line: 77, column: 31, scope: !118)
!129 = !DILocation(line: 77, column: 9, scope: !118)
!130 = distinct !{!130, !120, !131, !63}
!131 = !DILocation(line: 80, column: 9, scope: !115)
!132 = !DILocation(line: 82, column: 9, scope: !107)
!133 = !DILocation(line: 82, column: 21, scope: !107)
!134 = !DILocation(line: 83, column: 19, scope: !107)
!135 = !DILocation(line: 83, column: 9, scope: !107)
!136 = !DILocation(line: 85, column: 1, scope: !92)
!137 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 88, type: !15, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!138 = !DILocalVariable(name: "data", scope: !137, file: !14, line: 90, type: !4)
!139 = !DILocation(line: 90, column: 12, scope: !137)
!140 = !DILocalVariable(name: "dataBuffer", scope: !137, file: !14, line: 91, type: !4)
!141 = !DILocation(line: 91, column: 12, scope: !137)
!142 = !DILocation(line: 91, column: 33, scope: !137)
!143 = !DILocation(line: 92, column: 12, scope: !137)
!144 = !DILocation(line: 92, column: 5, scope: !137)
!145 = !DILocation(line: 93, column: 5, scope: !137)
!146 = !DILocation(line: 93, column: 23, scope: !137)
!147 = !DILocation(line: 97, column: 16, scope: !148)
!148 = distinct !DILexicalBlock(scope: !149, file: !14, line: 95, column: 5)
!149 = distinct !DILexicalBlock(scope: !137, file: !14, line: 94, column: 8)
!150 = !DILocation(line: 97, column: 14, scope: !148)
!151 = !DILocalVariable(name: "i", scope: !152, file: !14, line: 100, type: !33)
!152 = distinct !DILexicalBlock(scope: !137, file: !14, line: 99, column: 5)
!153 = !DILocation(line: 100, column: 16, scope: !152)
!154 = !DILocalVariable(name: "source", scope: !152, file: !14, line: 101, type: !38)
!155 = !DILocation(line: 101, column: 14, scope: !152)
!156 = !DILocation(line: 102, column: 9, scope: !152)
!157 = !DILocation(line: 103, column: 9, scope: !152)
!158 = !DILocation(line: 103, column: 23, scope: !152)
!159 = !DILocation(line: 105, column: 16, scope: !160)
!160 = distinct !DILexicalBlock(scope: !152, file: !14, line: 105, column: 9)
!161 = !DILocation(line: 105, column: 14, scope: !160)
!162 = !DILocation(line: 105, column: 21, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !14, line: 105, column: 9)
!164 = !DILocation(line: 105, column: 23, scope: !163)
!165 = !DILocation(line: 105, column: 9, scope: !160)
!166 = !DILocation(line: 107, column: 30, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !14, line: 106, column: 9)
!168 = !DILocation(line: 107, column: 23, scope: !167)
!169 = !DILocation(line: 107, column: 13, scope: !167)
!170 = !DILocation(line: 107, column: 18, scope: !167)
!171 = !DILocation(line: 107, column: 21, scope: !167)
!172 = !DILocation(line: 108, column: 9, scope: !167)
!173 = !DILocation(line: 105, column: 31, scope: !163)
!174 = !DILocation(line: 105, column: 9, scope: !163)
!175 = distinct !{!175, !165, !176, !63}
!176 = !DILocation(line: 108, column: 9, scope: !160)
!177 = !DILocation(line: 110, column: 9, scope: !152)
!178 = !DILocation(line: 110, column: 21, scope: !152)
!179 = !DILocation(line: 111, column: 19, scope: !152)
!180 = !DILocation(line: 111, column: 9, scope: !152)
!181 = !DILocation(line: 113, column: 1, scope: !137)
