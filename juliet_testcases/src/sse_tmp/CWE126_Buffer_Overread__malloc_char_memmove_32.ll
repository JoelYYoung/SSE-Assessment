; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_32.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memmove_32_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
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
  %call = call noalias align 16 i8* @malloc(i64 50) #8, !dbg !31
  store i8* %call, i8** %data1, align 8, !dbg !32
  %2 = load i8*, i8** %data1, align 8, !dbg !33
  %cmp = icmp eq i8* %2, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %data1, align 8, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !40
  %4 = load i8*, i8** %data1, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !41
  store i8 0, i8* %arrayidx, align 1, !dbg !42
  %5 = load i8*, i8** %data1, align 8, !dbg !43
  %6 = load i8**, i8*** %dataPtr1, align 8, !dbg !44
  store i8* %5, i8** %6, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !46, metadata !DIExpression()), !dbg !48
  %7 = load i8**, i8*** %dataPtr2, align 8, !dbg !49
  %8 = load i8*, i8** %7, align 8, !dbg !50
  store i8* %8, i8** %data2, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !51, metadata !DIExpression()), !dbg !56
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !57
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !58
  store i8 0, i8* %arrayidx3, align 1, !dbg !59
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !60
  %9 = load i8*, i8** %data2, align 8, !dbg !61
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !62
  %call6 = call i64 @strlen(i8* %arraydecay5) #10, !dbg !63
  %mul = mul i64 %call6, 1, !dbg !64
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay4, i8* align 1 %9, i64 %mul, i1 false), !dbg !60
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !65
  store i8 0, i8* %arrayidx7, align 1, !dbg !66
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !67
  call void @printLine(i8* %arraydecay8), !dbg !68
  %10 = load i8*, i8** %data2, align 8, !dbg !69
  call void @free(i8* %10) #8, !dbg !70
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

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printLine(i8*) #7

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memmove_32_good() #0 !dbg !72 {
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
  %call = call i64 @time(i64* null) #8, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #8, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE126_Buffer_Overread__malloc_char_memmove_32_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE126_Buffer_Overread__malloc_char_memmove_32_bad(), !dbg !90
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
  %data2 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
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
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !106
  store i8* %call, i8** %data1, align 8, !dbg !107
  %2 = load i8*, i8** %data1, align 8, !dbg !108
  %cmp = icmp eq i8* %2, null, !dbg !110
  br i1 %cmp, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !112
  unreachable, !dbg !112

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %data1, align 8, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 99, i1 false), !dbg !115
  %4 = load i8*, i8** %data1, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  %5 = load i8*, i8** %data1, align 8, !dbg !118
  %6 = load i8**, i8*** %dataPtr1, align 8, !dbg !119
  store i8* %5, i8** %6, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !121, metadata !DIExpression()), !dbg !123
  %7 = load i8**, i8*** %dataPtr2, align 8, !dbg !124
  %8 = load i8*, i8** %7, align 8, !dbg !125
  store i8* %8, i8** %data2, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !126, metadata !DIExpression()), !dbg !128
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !129
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !130
  store i8 0, i8* %arrayidx3, align 1, !dbg !131
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !132
  %9 = load i8*, i8** %data2, align 8, !dbg !133
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !134
  %call6 = call i64 @strlen(i8* %arraydecay5) #10, !dbg !135
  %mul = mul i64 %call6, 1, !dbg !136
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay4, i8* align 1 %9, i64 %mul, i1 false), !dbg !132
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !137
  store i8 0, i8* %arrayidx7, align 1, !dbg !138
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !139
  call void @printLine(i8* %arraydecay8), !dbg !140
  %10 = load i8*, i8** %data2, align 8, !dbg !141
  call void @free(i8* %10) #8, !dbg !142
  ret void, !dbg !143
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_32.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memmove_32_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_32.c", directory: "/root/SSE-Assessment")
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
!31 = !DILocation(line: 32, column: 24, scope: !27)
!32 = !DILocation(line: 32, column: 14, scope: !27)
!33 = !DILocation(line: 33, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !27, file: !15, line: 33, column: 13)
!35 = !DILocation(line: 33, column: 18, scope: !34)
!36 = !DILocation(line: 33, column: 13, scope: !27)
!37 = !DILocation(line: 33, column: 28, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !15, line: 33, column: 27)
!39 = !DILocation(line: 34, column: 16, scope: !27)
!40 = !DILocation(line: 34, column: 9, scope: !27)
!41 = !DILocation(line: 35, column: 9, scope: !27)
!42 = !DILocation(line: 35, column: 20, scope: !27)
!43 = !DILocation(line: 36, column: 21, scope: !27)
!44 = !DILocation(line: 36, column: 10, scope: !27)
!45 = !DILocation(line: 36, column: 19, scope: !27)
!46 = !DILocalVariable(name: "data", scope: !47, file: !15, line: 39, type: !4)
!47 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 5)
!48 = !DILocation(line: 39, column: 16, scope: !47)
!49 = !DILocation(line: 39, column: 24, scope: !47)
!50 = !DILocation(line: 39, column: 23, scope: !47)
!51 = !DILocalVariable(name: "dest", scope: !52, file: !15, line: 41, type: !53)
!52 = distinct !DILexicalBlock(scope: !47, file: !15, line: 40, column: 9)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 100)
!56 = !DILocation(line: 41, column: 18, scope: !52)
!57 = !DILocation(line: 42, column: 13, scope: !52)
!58 = !DILocation(line: 43, column: 13, scope: !52)
!59 = !DILocation(line: 43, column: 25, scope: !52)
!60 = !DILocation(line: 46, column: 13, scope: !52)
!61 = !DILocation(line: 46, column: 27, scope: !52)
!62 = !DILocation(line: 46, column: 40, scope: !52)
!63 = !DILocation(line: 46, column: 33, scope: !52)
!64 = !DILocation(line: 46, column: 45, scope: !52)
!65 = !DILocation(line: 47, column: 13, scope: !52)
!66 = !DILocation(line: 47, column: 25, scope: !52)
!67 = !DILocation(line: 48, column: 23, scope: !52)
!68 = !DILocation(line: 48, column: 13, scope: !52)
!69 = !DILocation(line: 49, column: 18, scope: !52)
!70 = !DILocation(line: 49, column: 13, scope: !52)
!71 = !DILocation(line: 52, column: 1, scope: !14)
!72 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memmove_32_good", scope: !15, file: !15, line: 90, type: !16, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 92, column: 5, scope: !72)
!74 = !DILocation(line: 93, column: 1, scope: !72)
!75 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 104, type: !76, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!78, !78, !21}
!78 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !15, line: 104, type: !78)
!80 = !DILocation(line: 104, column: 14, scope: !75)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !15, line: 104, type: !21)
!82 = !DILocation(line: 104, column: 27, scope: !75)
!83 = !DILocation(line: 107, column: 22, scope: !75)
!84 = !DILocation(line: 107, column: 12, scope: !75)
!85 = !DILocation(line: 107, column: 5, scope: !75)
!86 = !DILocation(line: 109, column: 5, scope: !75)
!87 = !DILocation(line: 110, column: 5, scope: !75)
!88 = !DILocation(line: 111, column: 5, scope: !75)
!89 = !DILocation(line: 114, column: 5, scope: !75)
!90 = !DILocation(line: 115, column: 5, scope: !75)
!91 = !DILocation(line: 116, column: 5, scope: !75)
!92 = !DILocation(line: 118, column: 5, scope: !75)
!93 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 59, type: !16, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !15, line: 61, type: !4)
!95 = !DILocation(line: 61, column: 12, scope: !93)
!96 = !DILocalVariable(name: "dataPtr1", scope: !93, file: !15, line: 62, type: !21)
!97 = !DILocation(line: 62, column: 13, scope: !93)
!98 = !DILocalVariable(name: "dataPtr2", scope: !93, file: !15, line: 63, type: !21)
!99 = !DILocation(line: 63, column: 13, scope: !93)
!100 = !DILocation(line: 64, column: 10, scope: !93)
!101 = !DILocalVariable(name: "data", scope: !102, file: !15, line: 66, type: !4)
!102 = distinct !DILexicalBlock(scope: !93, file: !15, line: 65, column: 5)
!103 = !DILocation(line: 66, column: 16, scope: !102)
!104 = !DILocation(line: 66, column: 24, scope: !102)
!105 = !DILocation(line: 66, column: 23, scope: !102)
!106 = !DILocation(line: 68, column: 24, scope: !102)
!107 = !DILocation(line: 68, column: 14, scope: !102)
!108 = !DILocation(line: 69, column: 13, scope: !109)
!109 = distinct !DILexicalBlock(scope: !102, file: !15, line: 69, column: 13)
!110 = !DILocation(line: 69, column: 18, scope: !109)
!111 = !DILocation(line: 69, column: 13, scope: !102)
!112 = !DILocation(line: 69, column: 28, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !15, line: 69, column: 27)
!114 = !DILocation(line: 70, column: 16, scope: !102)
!115 = !DILocation(line: 70, column: 9, scope: !102)
!116 = !DILocation(line: 71, column: 9, scope: !102)
!117 = !DILocation(line: 71, column: 21, scope: !102)
!118 = !DILocation(line: 72, column: 21, scope: !102)
!119 = !DILocation(line: 72, column: 10, scope: !102)
!120 = !DILocation(line: 72, column: 19, scope: !102)
!121 = !DILocalVariable(name: "data", scope: !122, file: !15, line: 75, type: !4)
!122 = distinct !DILexicalBlock(scope: !93, file: !15, line: 74, column: 5)
!123 = !DILocation(line: 75, column: 16, scope: !122)
!124 = !DILocation(line: 75, column: 24, scope: !122)
!125 = !DILocation(line: 75, column: 23, scope: !122)
!126 = !DILocalVariable(name: "dest", scope: !127, file: !15, line: 77, type: !53)
!127 = distinct !DILexicalBlock(scope: !122, file: !15, line: 76, column: 9)
!128 = !DILocation(line: 77, column: 18, scope: !127)
!129 = !DILocation(line: 78, column: 13, scope: !127)
!130 = !DILocation(line: 79, column: 13, scope: !127)
!131 = !DILocation(line: 79, column: 25, scope: !127)
!132 = !DILocation(line: 82, column: 13, scope: !127)
!133 = !DILocation(line: 82, column: 27, scope: !127)
!134 = !DILocation(line: 82, column: 40, scope: !127)
!135 = !DILocation(line: 82, column: 33, scope: !127)
!136 = !DILocation(line: 82, column: 45, scope: !127)
!137 = !DILocation(line: 83, column: 13, scope: !127)
!138 = !DILocation(line: 83, column: 25, scope: !127)
!139 = !DILocation(line: 84, column: 23, scope: !127)
!140 = !DILocation(line: 84, column: 13, scope: !127)
!141 = !DILocation(line: 85, column: 18, scope: !127)
!142 = !DILocation(line: 85, column: 13, scope: !127)
!143 = !DILocation(line: 88, column: 1, scope: !93)
