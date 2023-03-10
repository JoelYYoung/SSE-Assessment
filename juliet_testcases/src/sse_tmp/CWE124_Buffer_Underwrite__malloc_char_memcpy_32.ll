; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memcpy_32.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memcpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_memcpy_32_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !26, metadata !DIExpression()), !dbg !28
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !29
  %1 = load i8*, i8** %0, align 8, !dbg !30
  store i8* %1, i8** %data1, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !31, metadata !DIExpression()), !dbg !33
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !34
  store i8* %call, i8** %dataBuffer, align 8, !dbg !33
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  %cmp = icmp eq i8* %2, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 99, i1 false), !dbg !42
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !43
  store i8 0, i8* %arrayidx, align 1, !dbg !44
  %5 = load i8*, i8** %dataBuffer, align 8, !dbg !45
  %add.ptr = getelementptr inbounds i8, i8* %5, i64 -8, !dbg !46
  store i8* %add.ptr, i8** %data1, align 8, !dbg !47
  %6 = load i8*, i8** %data1, align 8, !dbg !48
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !49
  store i8* %6, i8** %7, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !51, metadata !DIExpression()), !dbg !53
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !54
  %9 = load i8*, i8** %8, align 8, !dbg !55
  store i8* %9, i8** %data2, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !56, metadata !DIExpression()), !dbg !61
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !62
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !62
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !63
  store i8 0, i8* %arrayidx3, align 1, !dbg !64
  %10 = load i8*, i8** %data2, align 8, !dbg !65
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !66
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %10, i8* align 16 %arraydecay4, i64 100, i1 false), !dbg !66
  %11 = load i8*, i8** %data2, align 8, !dbg !67
  %arrayidx5 = getelementptr inbounds i8, i8* %11, i64 99, !dbg !67
  store i8 0, i8* %arrayidx5, align 1, !dbg !68
  %12 = load i8*, i8** %data2, align 8, !dbg !69
  call void @printLine(i8* %12), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_memcpy_32_good() #0 !dbg !72 {
entry:
  call void @goodG2B(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #7, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #7, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE124_Buffer_Underwrite__malloc_char_memcpy_32_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE124_Buffer_Underwrite__malloc_char_memcpy_32_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !93 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !96, metadata !DIExpression()), !dbg !97
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !98, metadata !DIExpression()), !dbg !99
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !99
  store i8* null, i8** %data, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !101, metadata !DIExpression()), !dbg !103
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !104
  %1 = load i8*, i8** %0, align 8, !dbg !105
  store i8* %1, i8** %data1, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !106, metadata !DIExpression()), !dbg !108
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !109
  store i8* %call, i8** %dataBuffer, align 8, !dbg !108
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !110
  %cmp = icmp eq i8* %2, null, !dbg !112
  br i1 %cmp, label %if.then, label %if.end, !dbg !113

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !114
  unreachable, !dbg !114

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 99, i1 false), !dbg !117
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  %5 = load i8*, i8** %dataBuffer, align 8, !dbg !120
  store i8* %5, i8** %data1, align 8, !dbg !121
  %6 = load i8*, i8** %data1, align 8, !dbg !122
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !123
  store i8* %6, i8** %7, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !125, metadata !DIExpression()), !dbg !127
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !128
  %9 = load i8*, i8** %8, align 8, !dbg !129
  store i8* %9, i8** %data2, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !130, metadata !DIExpression()), !dbg !132
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !133
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !133
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !134
  store i8 0, i8* %arrayidx3, align 1, !dbg !135
  %10 = load i8*, i8** %data2, align 8, !dbg !136
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !137
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %10, i8* align 16 %arraydecay4, i64 100, i1 false), !dbg !137
  %11 = load i8*, i8** %data2, align 8, !dbg !138
  %arrayidx5 = getelementptr inbounds i8, i8* %11, i64 99, !dbg !138
  store i8 0, i8* %arrayidx5, align 1, !dbg !139
  %12 = load i8*, i8** %data2, align 8, !dbg !140
  call void @printLine(i8* %12), !dbg !141
  ret void, !dbg !142
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memcpy_32.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_memcpy_32_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memcpy_32.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocalVariable(name: "dataPtr1", scope: !14, file: !15, line: 26, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!22 = !DILocation(line: 26, column: 13, scope: !14)
!23 = !DILocalVariable(name: "dataPtr2", scope: !14, file: !15, line: 27, type: !21)
!24 = !DILocation(line: 27, column: 13, scope: !14)
!25 = !DILocation(line: 28, column: 10, scope: !14)
!26 = !DILocalVariable(name: "data", scope: !27, file: !15, line: 30, type: !4)
!27 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 5)
!28 = !DILocation(line: 30, column: 16, scope: !27)
!29 = !DILocation(line: 30, column: 24, scope: !27)
!30 = !DILocation(line: 30, column: 23, scope: !27)
!31 = !DILocalVariable(name: "dataBuffer", scope: !32, file: !15, line: 32, type: !4)
!32 = distinct !DILexicalBlock(scope: !27, file: !15, line: 31, column: 9)
!33 = !DILocation(line: 32, column: 20, scope: !32)
!34 = !DILocation(line: 32, column: 41, scope: !32)
!35 = !DILocation(line: 33, column: 17, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 33, column: 17)
!37 = !DILocation(line: 33, column: 28, scope: !36)
!38 = !DILocation(line: 33, column: 17, scope: !32)
!39 = !DILocation(line: 33, column: 38, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !15, line: 33, column: 37)
!41 = !DILocation(line: 34, column: 20, scope: !32)
!42 = !DILocation(line: 34, column: 13, scope: !32)
!43 = !DILocation(line: 35, column: 13, scope: !32)
!44 = !DILocation(line: 35, column: 31, scope: !32)
!45 = !DILocation(line: 37, column: 20, scope: !32)
!46 = !DILocation(line: 37, column: 31, scope: !32)
!47 = !DILocation(line: 37, column: 18, scope: !32)
!48 = !DILocation(line: 39, column: 21, scope: !27)
!49 = !DILocation(line: 39, column: 10, scope: !27)
!50 = !DILocation(line: 39, column: 19, scope: !27)
!51 = !DILocalVariable(name: "data", scope: !52, file: !15, line: 42, type: !4)
!52 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 5)
!53 = !DILocation(line: 42, column: 16, scope: !52)
!54 = !DILocation(line: 42, column: 24, scope: !52)
!55 = !DILocation(line: 42, column: 23, scope: !52)
!56 = !DILocalVariable(name: "source", scope: !57, file: !15, line: 44, type: !58)
!57 = distinct !DILexicalBlock(scope: !52, file: !15, line: 43, column: 9)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !59)
!59 = !{!60}
!60 = !DISubrange(count: 100)
!61 = !DILocation(line: 44, column: 18, scope: !57)
!62 = !DILocation(line: 45, column: 13, scope: !57)
!63 = !DILocation(line: 46, column: 13, scope: !57)
!64 = !DILocation(line: 46, column: 27, scope: !57)
!65 = !DILocation(line: 48, column: 20, scope: !57)
!66 = !DILocation(line: 48, column: 13, scope: !57)
!67 = !DILocation(line: 50, column: 13, scope: !57)
!68 = !DILocation(line: 50, column: 25, scope: !57)
!69 = !DILocation(line: 51, column: 23, scope: !57)
!70 = !DILocation(line: 51, column: 13, scope: !57)
!71 = !DILocation(line: 56, column: 1, scope: !14)
!72 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_memcpy_32_good", scope: !15, file: !15, line: 98, type: !16, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 100, column: 5, scope: !72)
!74 = !DILocation(line: 101, column: 1, scope: !72)
!75 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 112, type: !76, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!78, !78, !21}
!78 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !15, line: 112, type: !78)
!80 = !DILocation(line: 112, column: 14, scope: !75)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !15, line: 112, type: !21)
!82 = !DILocation(line: 112, column: 27, scope: !75)
!83 = !DILocation(line: 115, column: 22, scope: !75)
!84 = !DILocation(line: 115, column: 12, scope: !75)
!85 = !DILocation(line: 115, column: 5, scope: !75)
!86 = !DILocation(line: 117, column: 5, scope: !75)
!87 = !DILocation(line: 118, column: 5, scope: !75)
!88 = !DILocation(line: 119, column: 5, scope: !75)
!89 = !DILocation(line: 122, column: 5, scope: !75)
!90 = !DILocation(line: 123, column: 5, scope: !75)
!91 = !DILocation(line: 124, column: 5, scope: !75)
!92 = !DILocation(line: 126, column: 5, scope: !75)
!93 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 63, type: !16, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !15, line: 65, type: !4)
!95 = !DILocation(line: 65, column: 12, scope: !93)
!96 = !DILocalVariable(name: "dataPtr1", scope: !93, file: !15, line: 66, type: !21)
!97 = !DILocation(line: 66, column: 13, scope: !93)
!98 = !DILocalVariable(name: "dataPtr2", scope: !93, file: !15, line: 67, type: !21)
!99 = !DILocation(line: 67, column: 13, scope: !93)
!100 = !DILocation(line: 68, column: 10, scope: !93)
!101 = !DILocalVariable(name: "data", scope: !102, file: !15, line: 70, type: !4)
!102 = distinct !DILexicalBlock(scope: !93, file: !15, line: 69, column: 5)
!103 = !DILocation(line: 70, column: 16, scope: !102)
!104 = !DILocation(line: 70, column: 24, scope: !102)
!105 = !DILocation(line: 70, column: 23, scope: !102)
!106 = !DILocalVariable(name: "dataBuffer", scope: !107, file: !15, line: 72, type: !4)
!107 = distinct !DILexicalBlock(scope: !102, file: !15, line: 71, column: 9)
!108 = !DILocation(line: 72, column: 20, scope: !107)
!109 = !DILocation(line: 72, column: 41, scope: !107)
!110 = !DILocation(line: 73, column: 17, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !15, line: 73, column: 17)
!112 = !DILocation(line: 73, column: 28, scope: !111)
!113 = !DILocation(line: 73, column: 17, scope: !107)
!114 = !DILocation(line: 73, column: 38, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !15, line: 73, column: 37)
!116 = !DILocation(line: 74, column: 20, scope: !107)
!117 = !DILocation(line: 74, column: 13, scope: !107)
!118 = !DILocation(line: 75, column: 13, scope: !107)
!119 = !DILocation(line: 75, column: 31, scope: !107)
!120 = !DILocation(line: 77, column: 20, scope: !107)
!121 = !DILocation(line: 77, column: 18, scope: !107)
!122 = !DILocation(line: 79, column: 21, scope: !102)
!123 = !DILocation(line: 79, column: 10, scope: !102)
!124 = !DILocation(line: 79, column: 19, scope: !102)
!125 = !DILocalVariable(name: "data", scope: !126, file: !15, line: 82, type: !4)
!126 = distinct !DILexicalBlock(scope: !93, file: !15, line: 81, column: 5)
!127 = !DILocation(line: 82, column: 16, scope: !126)
!128 = !DILocation(line: 82, column: 24, scope: !126)
!129 = !DILocation(line: 82, column: 23, scope: !126)
!130 = !DILocalVariable(name: "source", scope: !131, file: !15, line: 84, type: !58)
!131 = distinct !DILexicalBlock(scope: !126, file: !15, line: 83, column: 9)
!132 = !DILocation(line: 84, column: 18, scope: !131)
!133 = !DILocation(line: 85, column: 13, scope: !131)
!134 = !DILocation(line: 86, column: 13, scope: !131)
!135 = !DILocation(line: 86, column: 27, scope: !131)
!136 = !DILocation(line: 88, column: 20, scope: !131)
!137 = !DILocation(line: 88, column: 13, scope: !131)
!138 = !DILocation(line: 90, column: 13, scope: !131)
!139 = !DILocation(line: 90, column: 25, scope: !131)
!140 = !DILocation(line: 91, column: 23, scope: !131)
!141 = !DILocation(line: 91, column: 13, scope: !131)
!142 = !DILocation(line: 96, column: 1, scope: !93)
