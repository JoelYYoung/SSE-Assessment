; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_12.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memmove_12_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.else, !dbg !23

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 50) #8, !dbg !24
  store i8* %call1, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then2, label %if.end, !dbg !30

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #9, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %data, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !34
  %2 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  br label %if.end8, !dbg !37

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !38
  store i8* %call3, i8** %data, align 8, !dbg !40
  %3 = load i8*, i8** %data, align 8, !dbg !41
  %cmp4 = icmp eq i8* %3, null, !dbg !43
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !44

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #9, !dbg !45
  unreachable, !dbg !45

if.end6:                                          ; preds = %if.else
  %4 = load i8*, i8** %data, align 8, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !48
  %5 = load i8*, i8** %data, align 8, !dbg !49
  %arrayidx7 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !49
  store i8 0, i8* %arrayidx7, align 1, !dbg !50
  br label %if.end8

if.end8:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !51, metadata !DIExpression()), !dbg !56
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !57
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !58
  store i8 0, i8* %arrayidx9, align 1, !dbg !59
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !60
  %6 = load i8*, i8** %data, align 8, !dbg !61
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !62
  %call12 = call i64 @strlen(i8* %arraydecay11) #10, !dbg !63
  %mul = mul i64 %call12, 1, !dbg !64
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay10, i8* align 1 %6, i64 %mul, i1 false), !dbg !60
  %arrayidx13 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !65
  store i8 0, i8* %arrayidx13, align 1, !dbg !66
  %arraydecay14 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !67
  call void @printLine(i8* %arraydecay14), !dbg !68
  %7 = load i8*, i8** %data, align 8, !dbg !69
  call void @free(i8* %7) #8, !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #6

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #7

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memmove_12_good() #0 !dbg !72 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #8, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #8, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE126_Buffer_Overread__malloc_char_memmove_12_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE126_Buffer_Overread__malloc_char_memmove_12_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !94 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !95, metadata !DIExpression()), !dbg !96
  store i8* null, i8** %data, align 8, !dbg !97
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !98
  %tobool = icmp ne i32 %call, 0, !dbg !98
  br i1 %tobool, label %if.then, label %if.else, !dbg !100

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !101
  store i8* %call1, i8** %data, align 8, !dbg !103
  %0 = load i8*, i8** %data, align 8, !dbg !104
  %cmp = icmp eq i8* %0, null, !dbg !106
  br i1 %cmp, label %if.then2, label %if.end, !dbg !107

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #9, !dbg !108
  unreachable, !dbg !108

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %data, align 8, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !111
  %2 = load i8*, i8** %data, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !112
  store i8 0, i8* %arrayidx, align 1, !dbg !113
  br label %if.end8, !dbg !114

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !115
  store i8* %call3, i8** %data, align 8, !dbg !117
  %3 = load i8*, i8** %data, align 8, !dbg !118
  %cmp4 = icmp eq i8* %3, null, !dbg !120
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !121

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #9, !dbg !122
  unreachable, !dbg !122

if.end6:                                          ; preds = %if.else
  %4 = load i8*, i8** %data, align 8, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !125
  %5 = load i8*, i8** %data, align 8, !dbg !126
  %arrayidx7 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !126
  store i8 0, i8* %arrayidx7, align 1, !dbg !127
  br label %if.end8

if.end8:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !128, metadata !DIExpression()), !dbg !130
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !131
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !132
  store i8 0, i8* %arrayidx9, align 1, !dbg !133
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !134
  %6 = load i8*, i8** %data, align 8, !dbg !135
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !136
  %call12 = call i64 @strlen(i8* %arraydecay11) #10, !dbg !137
  %mul = mul i64 %call12, 1, !dbg !138
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay10, i8* align 1 %6, i64 %mul, i1 false), !dbg !134
  %arrayidx13 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !139
  store i8 0, i8* %arrayidx13, align 1, !dbg !140
  %arraydecay14 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !141
  call void @printLine(i8* %arraydecay14), !dbg !142
  %7 = load i8*, i8** %data, align 8, !dbg !143
  call void @free(i8* %7) #8, !dbg !144
  ret void, !dbg !145
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { argmemonly nofree nounwind willreturn }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_12.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memmove_12_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_12.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 8, scope: !14)
!24 = !DILocation(line: 30, column: 24, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 28, column: 5)
!26 = !DILocation(line: 30, column: 14, scope: !25)
!27 = !DILocation(line: 31, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !15, line: 31, column: 13)
!29 = !DILocation(line: 31, column: 18, scope: !28)
!30 = !DILocation(line: 31, column: 13, scope: !25)
!31 = !DILocation(line: 31, column: 28, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 31, column: 27)
!33 = !DILocation(line: 32, column: 16, scope: !25)
!34 = !DILocation(line: 32, column: 9, scope: !25)
!35 = !DILocation(line: 33, column: 9, scope: !25)
!36 = !DILocation(line: 33, column: 20, scope: !25)
!37 = !DILocation(line: 34, column: 5, scope: !25)
!38 = !DILocation(line: 38, column: 24, scope: !39)
!39 = distinct !DILexicalBlock(scope: !22, file: !15, line: 36, column: 5)
!40 = !DILocation(line: 38, column: 14, scope: !39)
!41 = !DILocation(line: 39, column: 13, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !15, line: 39, column: 13)
!43 = !DILocation(line: 39, column: 18, scope: !42)
!44 = !DILocation(line: 39, column: 13, scope: !39)
!45 = !DILocation(line: 39, column: 28, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !15, line: 39, column: 27)
!47 = !DILocation(line: 40, column: 16, scope: !39)
!48 = !DILocation(line: 40, column: 9, scope: !39)
!49 = !DILocation(line: 41, column: 9, scope: !39)
!50 = !DILocation(line: 41, column: 21, scope: !39)
!51 = !DILocalVariable(name: "dest", scope: !52, file: !15, line: 44, type: !53)
!52 = distinct !DILexicalBlock(scope: !14, file: !15, line: 43, column: 5)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 100)
!56 = !DILocation(line: 44, column: 14, scope: !52)
!57 = !DILocation(line: 45, column: 9, scope: !52)
!58 = !DILocation(line: 46, column: 9, scope: !52)
!59 = !DILocation(line: 46, column: 21, scope: !52)
!60 = !DILocation(line: 49, column: 9, scope: !52)
!61 = !DILocation(line: 49, column: 23, scope: !52)
!62 = !DILocation(line: 49, column: 36, scope: !52)
!63 = !DILocation(line: 49, column: 29, scope: !52)
!64 = !DILocation(line: 49, column: 41, scope: !52)
!65 = !DILocation(line: 50, column: 9, scope: !52)
!66 = !DILocation(line: 50, column: 21, scope: !52)
!67 = !DILocation(line: 51, column: 19, scope: !52)
!68 = !DILocation(line: 51, column: 9, scope: !52)
!69 = !DILocation(line: 52, column: 14, scope: !52)
!70 = !DILocation(line: 52, column: 9, scope: !52)
!71 = !DILocation(line: 54, column: 1, scope: !14)
!72 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memmove_12_good", scope: !15, file: !15, line: 95, type: !16, scopeLine: 96, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 97, column: 5, scope: !72)
!74 = !DILocation(line: 98, column: 1, scope: !72)
!75 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 110, type: !76, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!78, !78, !79}
!78 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !15, line: 110, type: !78)
!81 = !DILocation(line: 110, column: 14, scope: !75)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !15, line: 110, type: !79)
!83 = !DILocation(line: 110, column: 27, scope: !75)
!84 = !DILocation(line: 113, column: 22, scope: !75)
!85 = !DILocation(line: 113, column: 12, scope: !75)
!86 = !DILocation(line: 113, column: 5, scope: !75)
!87 = !DILocation(line: 115, column: 5, scope: !75)
!88 = !DILocation(line: 116, column: 5, scope: !75)
!89 = !DILocation(line: 117, column: 5, scope: !75)
!90 = !DILocation(line: 120, column: 5, scope: !75)
!91 = !DILocation(line: 121, column: 5, scope: !75)
!92 = !DILocation(line: 122, column: 5, scope: !75)
!93 = !DILocation(line: 124, column: 5, scope: !75)
!94 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 62, type: !16, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !15, line: 64, type: !4)
!96 = !DILocation(line: 64, column: 12, scope: !94)
!97 = !DILocation(line: 65, column: 10, scope: !94)
!98 = !DILocation(line: 66, column: 8, scope: !99)
!99 = distinct !DILexicalBlock(scope: !94, file: !15, line: 66, column: 8)
!100 = !DILocation(line: 66, column: 8, scope: !94)
!101 = !DILocation(line: 69, column: 24, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !15, line: 67, column: 5)
!103 = !DILocation(line: 69, column: 14, scope: !102)
!104 = !DILocation(line: 70, column: 13, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !15, line: 70, column: 13)
!106 = !DILocation(line: 70, column: 18, scope: !105)
!107 = !DILocation(line: 70, column: 13, scope: !102)
!108 = !DILocation(line: 70, column: 28, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !15, line: 70, column: 27)
!110 = !DILocation(line: 71, column: 16, scope: !102)
!111 = !DILocation(line: 71, column: 9, scope: !102)
!112 = !DILocation(line: 72, column: 9, scope: !102)
!113 = !DILocation(line: 72, column: 21, scope: !102)
!114 = !DILocation(line: 73, column: 5, scope: !102)
!115 = !DILocation(line: 77, column: 24, scope: !116)
!116 = distinct !DILexicalBlock(scope: !99, file: !15, line: 75, column: 5)
!117 = !DILocation(line: 77, column: 14, scope: !116)
!118 = !DILocation(line: 78, column: 13, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !15, line: 78, column: 13)
!120 = !DILocation(line: 78, column: 18, scope: !119)
!121 = !DILocation(line: 78, column: 13, scope: !116)
!122 = !DILocation(line: 78, column: 28, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !15, line: 78, column: 27)
!124 = !DILocation(line: 79, column: 16, scope: !116)
!125 = !DILocation(line: 79, column: 9, scope: !116)
!126 = !DILocation(line: 80, column: 9, scope: !116)
!127 = !DILocation(line: 80, column: 21, scope: !116)
!128 = !DILocalVariable(name: "dest", scope: !129, file: !15, line: 83, type: !53)
!129 = distinct !DILexicalBlock(scope: !94, file: !15, line: 82, column: 5)
!130 = !DILocation(line: 83, column: 14, scope: !129)
!131 = !DILocation(line: 84, column: 9, scope: !129)
!132 = !DILocation(line: 85, column: 9, scope: !129)
!133 = !DILocation(line: 85, column: 21, scope: !129)
!134 = !DILocation(line: 88, column: 9, scope: !129)
!135 = !DILocation(line: 88, column: 23, scope: !129)
!136 = !DILocation(line: 88, column: 36, scope: !129)
!137 = !DILocation(line: 88, column: 29, scope: !129)
!138 = !DILocation(line: 88, column: 41, scope: !129)
!139 = !DILocation(line: 89, column: 9, scope: !129)
!140 = !DILocation(line: 89, column: 21, scope: !129)
!141 = !DILocation(line: 90, column: 19, scope: !129)
!142 = !DILocation(line: 90, column: 9, scope: !129)
!143 = !DILocation(line: 91, column: 14, scope: !129)
!144 = !DILocation(line: 91, column: 9, scope: !129)
!145 = !DILocation(line: 93, column: 1, scope: !94)
