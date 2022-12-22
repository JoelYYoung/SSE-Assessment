; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_12_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  store i8* %1, i8** %data, align 8, !dbg !23
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !24
  %tobool = icmp ne i32 %call, 0, !dbg !24
  br i1 %tobool, label %if.then, label %if.else, !dbg !26

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !29
  %3 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  br label %if.end, !dbg !32

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %data, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 49, i1 false), !dbg !35
  %5 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 49, !dbg !36
  store i8 0, i8* %arrayidx1, align 1, !dbg !37
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !49, metadata !DIExpression()), !dbg !50
  %7 = load i8*, i8** %data, align 8, !dbg !51
  %call2 = call i64 @strlen(i8* %7) #6, !dbg !52
  store i64 %call2, i64* %dataLen, align 8, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !57
  %9 = load i64, i64* %dataLen, align 8, !dbg !59
  %cmp = icmp ult i64 %8, %9, !dbg !60
  br i1 %cmp, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !62
  %11 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx3 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !62
  %12 = load i8, i8* %arrayidx3, align 1, !dbg !62
  %13 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %13, !dbg !66
  store i8 %12, i8* %arrayidx4, align 1, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %14, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !74
  store i8 0, i8* %arrayidx5, align 1, !dbg !75
  %15 = load i8*, i8** %data, align 8, !dbg !76
  call void @printLine(i8* %15), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_12_good() #0 !dbg !79 {
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
  %call = call i64 @time(i64* null) #7, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #7, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_12_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_12_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !101 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = alloca i8, i64 100, align 16, !dbg !106
  store i8* %0, i8** %dataBuffer, align 8, !dbg !105
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !107
  store i8* %1, i8** %data, align 8, !dbg !108
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !109
  %tobool = icmp ne i32 %call, 0, !dbg !109
  br i1 %tobool, label %if.then, label %if.else, !dbg !111

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !114
  %3 = load i8*, i8** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  br label %if.end, !dbg !117

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %data, align 8, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 49, i1 false), !dbg !120
  %5 = load i8*, i8** %data, align 8, !dbg !121
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 49, !dbg !121
  store i8 0, i8* %arrayidx1, align 1, !dbg !122
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !123, metadata !DIExpression()), !dbg !125
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %i, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !128, metadata !DIExpression()), !dbg !129
  %7 = load i8*, i8** %data, align 8, !dbg !130
  %call2 = call i64 @strlen(i8* %7) #6, !dbg !131
  store i64 %call2, i64* %dataLen, align 8, !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !136
  %9 = load i64, i64* %dataLen, align 8, !dbg !138
  %cmp = icmp ult i64 %8, %9, !dbg !139
  br i1 %cmp, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !141
  %11 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx3 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !141
  %12 = load i8, i8* %arrayidx3, align 1, !dbg !141
  %13 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %13, !dbg !145
  store i8 %12, i8* %arrayidx4, align 1, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !148
  %inc = add i64 %14, 1, !dbg !148
  store i64 %inc, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !152
  store i8 0, i8* %arrayidx5, align 1, !dbg !153
  %15 = load i8*, i8** %data, align 8, !dbg !154
  call void @printLine(i8* %15), !dbg !155
  ret void, !dbg !156
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_12.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_12_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_12.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 10, scope: !13)
!24 = !DILocation(line: 28, column: 8, scope: !25)
!25 = distinct !DILexicalBlock(scope: !13, file: !14, line: 28, column: 8)
!26 = !DILocation(line: 28, column: 8, scope: !13)
!27 = !DILocation(line: 31, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !14, line: 29, column: 5)
!29 = !DILocation(line: 31, column: 9, scope: !28)
!30 = !DILocation(line: 32, column: 9, scope: !28)
!31 = !DILocation(line: 32, column: 21, scope: !28)
!32 = !DILocation(line: 33, column: 5, scope: !28)
!33 = !DILocation(line: 37, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !25, file: !14, line: 35, column: 5)
!35 = !DILocation(line: 37, column: 9, scope: !34)
!36 = !DILocation(line: 38, column: 9, scope: !34)
!37 = !DILocation(line: 38, column: 20, scope: !34)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !14, line: 41, type: !40)
!39 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 41, column: 14, scope: !39)
!44 = !DILocalVariable(name: "i", scope: !39, file: !14, line: 42, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 46, baseType: !47)
!46 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 42, column: 16, scope: !39)
!49 = !DILocalVariable(name: "dataLen", scope: !39, file: !14, line: 42, type: !45)
!50 = !DILocation(line: 42, column: 19, scope: !39)
!51 = !DILocation(line: 43, column: 26, scope: !39)
!52 = !DILocation(line: 43, column: 19, scope: !39)
!53 = !DILocation(line: 43, column: 17, scope: !39)
!54 = !DILocation(line: 45, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !39, file: !14, line: 45, column: 9)
!56 = !DILocation(line: 45, column: 14, scope: !55)
!57 = !DILocation(line: 45, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !14, line: 45, column: 9)
!59 = !DILocation(line: 45, column: 25, scope: !58)
!60 = !DILocation(line: 45, column: 23, scope: !58)
!61 = !DILocation(line: 45, column: 9, scope: !55)
!62 = !DILocation(line: 47, column: 23, scope: !63)
!63 = distinct !DILexicalBlock(scope: !58, file: !14, line: 46, column: 9)
!64 = !DILocation(line: 47, column: 28, scope: !63)
!65 = !DILocation(line: 47, column: 18, scope: !63)
!66 = !DILocation(line: 47, column: 13, scope: !63)
!67 = !DILocation(line: 47, column: 21, scope: !63)
!68 = !DILocation(line: 48, column: 9, scope: !63)
!69 = !DILocation(line: 45, column: 35, scope: !58)
!70 = !DILocation(line: 45, column: 9, scope: !58)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 48, column: 9, scope: !55)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 49, column: 9, scope: !39)
!75 = !DILocation(line: 49, column: 20, scope: !39)
!76 = !DILocation(line: 50, column: 19, scope: !39)
!77 = !DILocation(line: 50, column: 9, scope: !39)
!78 = !DILocation(line: 52, column: 1, scope: !13)
!79 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_12_good", scope: !14, file: !14, line: 91, type: !15, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 93, column: 5, scope: !79)
!81 = !DILocation(line: 94, column: 1, scope: !79)
!82 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 106, type: !83, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DISubroutineType(types: !84)
!84 = !{!85, !85, !86}
!85 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !14, line: 106, type: !85)
!88 = !DILocation(line: 106, column: 14, scope: !82)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !14, line: 106, type: !86)
!90 = !DILocation(line: 106, column: 27, scope: !82)
!91 = !DILocation(line: 109, column: 22, scope: !82)
!92 = !DILocation(line: 109, column: 12, scope: !82)
!93 = !DILocation(line: 109, column: 5, scope: !82)
!94 = !DILocation(line: 111, column: 5, scope: !82)
!95 = !DILocation(line: 112, column: 5, scope: !82)
!96 = !DILocation(line: 113, column: 5, scope: !82)
!97 = !DILocation(line: 116, column: 5, scope: !82)
!98 = !DILocation(line: 117, column: 5, scope: !82)
!99 = !DILocation(line: 118, column: 5, scope: !82)
!100 = !DILocation(line: 120, column: 5, scope: !82)
!101 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 60, type: !15, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !14, line: 62, type: !4)
!103 = !DILocation(line: 62, column: 12, scope: !101)
!104 = !DILocalVariable(name: "dataBuffer", scope: !101, file: !14, line: 63, type: !4)
!105 = !DILocation(line: 63, column: 12, scope: !101)
!106 = !DILocation(line: 63, column: 33, scope: !101)
!107 = !DILocation(line: 64, column: 12, scope: !101)
!108 = !DILocation(line: 64, column: 10, scope: !101)
!109 = !DILocation(line: 65, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !101, file: !14, line: 65, column: 8)
!111 = !DILocation(line: 65, column: 8, scope: !101)
!112 = !DILocation(line: 68, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !14, line: 66, column: 5)
!114 = !DILocation(line: 68, column: 9, scope: !113)
!115 = !DILocation(line: 69, column: 9, scope: !113)
!116 = !DILocation(line: 69, column: 20, scope: !113)
!117 = !DILocation(line: 70, column: 5, scope: !113)
!118 = !DILocation(line: 74, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !110, file: !14, line: 72, column: 5)
!120 = !DILocation(line: 74, column: 9, scope: !119)
!121 = !DILocation(line: 75, column: 9, scope: !119)
!122 = !DILocation(line: 75, column: 20, scope: !119)
!123 = !DILocalVariable(name: "dest", scope: !124, file: !14, line: 78, type: !40)
!124 = distinct !DILexicalBlock(scope: !101, file: !14, line: 77, column: 5)
!125 = !DILocation(line: 78, column: 14, scope: !124)
!126 = !DILocalVariable(name: "i", scope: !124, file: !14, line: 79, type: !45)
!127 = !DILocation(line: 79, column: 16, scope: !124)
!128 = !DILocalVariable(name: "dataLen", scope: !124, file: !14, line: 79, type: !45)
!129 = !DILocation(line: 79, column: 19, scope: !124)
!130 = !DILocation(line: 80, column: 26, scope: !124)
!131 = !DILocation(line: 80, column: 19, scope: !124)
!132 = !DILocation(line: 80, column: 17, scope: !124)
!133 = !DILocation(line: 82, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !124, file: !14, line: 82, column: 9)
!135 = !DILocation(line: 82, column: 14, scope: !134)
!136 = !DILocation(line: 82, column: 21, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !14, line: 82, column: 9)
!138 = !DILocation(line: 82, column: 25, scope: !137)
!139 = !DILocation(line: 82, column: 23, scope: !137)
!140 = !DILocation(line: 82, column: 9, scope: !134)
!141 = !DILocation(line: 84, column: 23, scope: !142)
!142 = distinct !DILexicalBlock(scope: !137, file: !14, line: 83, column: 9)
!143 = !DILocation(line: 84, column: 28, scope: !142)
!144 = !DILocation(line: 84, column: 18, scope: !142)
!145 = !DILocation(line: 84, column: 13, scope: !142)
!146 = !DILocation(line: 84, column: 21, scope: !142)
!147 = !DILocation(line: 85, column: 9, scope: !142)
!148 = !DILocation(line: 82, column: 35, scope: !137)
!149 = !DILocation(line: 82, column: 9, scope: !137)
!150 = distinct !{!150, !140, !151, !73}
!151 = !DILocation(line: 85, column: 9, scope: !134)
!152 = !DILocation(line: 86, column: 9, scope: !124)
!153 = !DILocation(line: 86, column: 20, scope: !124)
!154 = !DILocation(line: 87, column: 19, scope: !124)
!155 = !DILocation(line: 87, column: 9, scope: !124)
!156 = !DILocation(line: 89, column: 1, scope: !101)
