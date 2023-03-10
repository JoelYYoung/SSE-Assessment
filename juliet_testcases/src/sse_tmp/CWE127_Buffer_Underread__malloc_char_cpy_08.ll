; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_08.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_cpy_08_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call i32 @staticReturnsTrue(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end3, !dbg !23

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !27
  %call1 = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !28
  store i8* %call1, i8** %dataBuffer, align 8, !dbg !27
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  %cmp = icmp eq i8* %0, null, !dbg !31
  br i1 %cmp, label %if.then2, label %if.end, !dbg !32

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !36
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !39
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !40
  store i8* %add.ptr, i8** %data, align 8, !dbg !41
  br label %if.end3, !dbg !42

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !43, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !49
  %arrayidx4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !50
  store i8 0, i8* %arrayidx4, align 1, !dbg !51
  %arraydecay5 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !52
  %4 = load i8*, i8** %data, align 8, !dbg !53
  %call6 = call i8* @strcpy(i8* %arraydecay5, i8* %4) #6, !dbg !54
  %arraydecay7 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !55
  call void @printLine(i8* %arraydecay7), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_cpy_08_good() #0 !dbg !58 {
entry:
  call void @goodG2B1(), !dbg !59
  call void @goodG2B2(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #6, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #6, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE127_Buffer_Underread__malloc_char_cpy_08_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE127_Buffer_Underread__malloc_char_cpy_08_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !81 {
entry:
  ret i32 1, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !85 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !86, metadata !DIExpression()), !dbg !87
  store i8* null, i8** %data, align 8, !dbg !88
  %call = call i32 @staticReturnsFalse(), !dbg !89
  %tobool = icmp ne i32 %call, 0, !dbg !89
  br i1 %tobool, label %if.then, label %if.else, !dbg !91

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  br label %if.end3, !dbg !94

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !95, metadata !DIExpression()), !dbg !98
  %call1 = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !99
  store i8* %call1, i8** %dataBuffer, align 8, !dbg !98
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !100
  %cmp = icmp eq i8* %0, null, !dbg !102
  br i1 %cmp, label %if.then2, label %if.end, !dbg !103

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !104
  unreachable, !dbg !104

if.end:                                           ; preds = %if.else
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !107
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !110
  store i8* %3, i8** %data, align 8, !dbg !111
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !112, metadata !DIExpression()), !dbg !114
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !115
  %arrayidx4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !116
  store i8 0, i8* %arrayidx4, align 1, !dbg !117
  %arraydecay5 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !118
  %4 = load i8*, i8** %data, align 8, !dbg !119
  %call6 = call i8* @strcpy(i8* %arraydecay5, i8* %4) #6, !dbg !120
  %arraydecay7 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !121
  call void @printLine(i8* %arraydecay7), !dbg !122
  ret void, !dbg !123
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !124 {
entry:
  ret i32 0, !dbg !125
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !126 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !127, metadata !DIExpression()), !dbg !128
  store i8* null, i8** %data, align 8, !dbg !129
  %call = call i32 @staticReturnsTrue(), !dbg !130
  %tobool = icmp ne i32 %call, 0, !dbg !130
  br i1 %tobool, label %if.then, label %if.end3, !dbg !132

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !133, metadata !DIExpression()), !dbg !136
  %call1 = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !137
  store i8* %call1, i8** %dataBuffer, align 8, !dbg !136
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !138
  %cmp = icmp eq i8* %0, null, !dbg !140
  br i1 %cmp, label %if.then2, label %if.end, !dbg !141

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !142
  unreachable, !dbg !142

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !144
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !145
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !146
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !146
  store i8 0, i8* %arrayidx, align 1, !dbg !147
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !148
  store i8* %3, i8** %data, align 8, !dbg !149
  br label %if.end3, !dbg !150

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !151, metadata !DIExpression()), !dbg !153
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !154
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !154
  %arrayidx4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !155
  store i8 0, i8* %arrayidx4, align 1, !dbg !156
  %arraydecay5 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !157
  %4 = load i8*, i8** %data, align 8, !dbg !158
  %call6 = call i8* @strcpy(i8* %arraydecay5, i8* %4) #6, !dbg !159
  %arraydecay7 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !160
  call void @printLine(i8* %arraydecay7), !dbg !161
  ret void, !dbg !162
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_cpy_08_bad", scope: !15, file: !15, line: 37, type: !16, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_08.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 39, type: !4)
!19 = !DILocation(line: 39, column: 12, scope: !14)
!20 = !DILocation(line: 40, column: 10, scope: !14)
!21 = !DILocation(line: 41, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 8)
!23 = !DILocation(line: 41, column: 8, scope: !14)
!24 = !DILocalVariable(name: "dataBuffer", scope: !25, file: !15, line: 44, type: !4)
!25 = distinct !DILexicalBlock(scope: !26, file: !15, line: 43, column: 9)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 42, column: 5)
!27 = !DILocation(line: 44, column: 20, scope: !25)
!28 = !DILocation(line: 44, column: 41, scope: !25)
!29 = !DILocation(line: 45, column: 17, scope: !30)
!30 = distinct !DILexicalBlock(scope: !25, file: !15, line: 45, column: 17)
!31 = !DILocation(line: 45, column: 28, scope: !30)
!32 = !DILocation(line: 45, column: 17, scope: !25)
!33 = !DILocation(line: 45, column: 38, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !15, line: 45, column: 37)
!35 = !DILocation(line: 46, column: 20, scope: !25)
!36 = !DILocation(line: 46, column: 13, scope: !25)
!37 = !DILocation(line: 47, column: 13, scope: !25)
!38 = !DILocation(line: 47, column: 31, scope: !25)
!39 = !DILocation(line: 49, column: 20, scope: !25)
!40 = !DILocation(line: 49, column: 31, scope: !25)
!41 = !DILocation(line: 49, column: 18, scope: !25)
!42 = !DILocation(line: 51, column: 5, scope: !26)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !15, line: 53, type: !45)
!44 = distinct !DILexicalBlock(scope: !14, file: !15, line: 52, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 200)
!48 = !DILocation(line: 53, column: 14, scope: !44)
!49 = !DILocation(line: 54, column: 9, scope: !44)
!50 = !DILocation(line: 55, column: 9, scope: !44)
!51 = !DILocation(line: 55, column: 23, scope: !44)
!52 = !DILocation(line: 57, column: 16, scope: !44)
!53 = !DILocation(line: 57, column: 22, scope: !44)
!54 = !DILocation(line: 57, column: 9, scope: !44)
!55 = !DILocation(line: 58, column: 19, scope: !44)
!56 = !DILocation(line: 58, column: 9, scope: !44)
!57 = !DILocation(line: 62, column: 1, scope: !14)
!58 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_cpy_08_good", scope: !15, file: !15, line: 129, type: !16, scopeLine: 130, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 131, column: 5, scope: !58)
!60 = !DILocation(line: 132, column: 5, scope: !58)
!61 = !DILocation(line: 133, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 145, type: !63, scopeLine: 146, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!65, !65, !66}
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !15, line: 145, type: !65)
!68 = !DILocation(line: 145, column: 14, scope: !62)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !15, line: 145, type: !66)
!70 = !DILocation(line: 145, column: 27, scope: !62)
!71 = !DILocation(line: 148, column: 22, scope: !62)
!72 = !DILocation(line: 148, column: 12, scope: !62)
!73 = !DILocation(line: 148, column: 5, scope: !62)
!74 = !DILocation(line: 150, column: 5, scope: !62)
!75 = !DILocation(line: 151, column: 5, scope: !62)
!76 = !DILocation(line: 152, column: 5, scope: !62)
!77 = !DILocation(line: 155, column: 5, scope: !62)
!78 = !DILocation(line: 156, column: 5, scope: !62)
!79 = !DILocation(line: 157, column: 5, scope: !62)
!80 = !DILocation(line: 159, column: 5, scope: !62)
!81 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 25, type: !82, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!65}
!84 = !DILocation(line: 27, column: 5, scope: !81)
!85 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 69, type: !16, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !15, line: 71, type: !4)
!87 = !DILocation(line: 71, column: 12, scope: !85)
!88 = !DILocation(line: 72, column: 10, scope: !85)
!89 = !DILocation(line: 73, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !85, file: !15, line: 73, column: 8)
!91 = !DILocation(line: 73, column: 8, scope: !85)
!92 = !DILocation(line: 76, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !15, line: 74, column: 5)
!94 = !DILocation(line: 77, column: 5, scope: !93)
!95 = !DILocalVariable(name: "dataBuffer", scope: !96, file: !15, line: 81, type: !4)
!96 = distinct !DILexicalBlock(scope: !97, file: !15, line: 80, column: 9)
!97 = distinct !DILexicalBlock(scope: !90, file: !15, line: 79, column: 5)
!98 = !DILocation(line: 81, column: 20, scope: !96)
!99 = !DILocation(line: 81, column: 41, scope: !96)
!100 = !DILocation(line: 82, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !96, file: !15, line: 82, column: 17)
!102 = !DILocation(line: 82, column: 28, scope: !101)
!103 = !DILocation(line: 82, column: 17, scope: !96)
!104 = !DILocation(line: 82, column: 38, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !15, line: 82, column: 37)
!106 = !DILocation(line: 83, column: 20, scope: !96)
!107 = !DILocation(line: 83, column: 13, scope: !96)
!108 = !DILocation(line: 84, column: 13, scope: !96)
!109 = !DILocation(line: 84, column: 31, scope: !96)
!110 = !DILocation(line: 86, column: 20, scope: !96)
!111 = !DILocation(line: 86, column: 18, scope: !96)
!112 = !DILocalVariable(name: "dest", scope: !113, file: !15, line: 90, type: !45)
!113 = distinct !DILexicalBlock(scope: !85, file: !15, line: 89, column: 5)
!114 = !DILocation(line: 90, column: 14, scope: !113)
!115 = !DILocation(line: 91, column: 9, scope: !113)
!116 = !DILocation(line: 92, column: 9, scope: !113)
!117 = !DILocation(line: 92, column: 23, scope: !113)
!118 = !DILocation(line: 94, column: 16, scope: !113)
!119 = !DILocation(line: 94, column: 22, scope: !113)
!120 = !DILocation(line: 94, column: 9, scope: !113)
!121 = !DILocation(line: 95, column: 19, scope: !113)
!122 = !DILocation(line: 95, column: 9, scope: !113)
!123 = !DILocation(line: 99, column: 1, scope: !85)
!124 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 30, type: !82, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!125 = !DILocation(line: 32, column: 5, scope: !124)
!126 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 102, type: !16, scopeLine: 103, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!127 = !DILocalVariable(name: "data", scope: !126, file: !15, line: 104, type: !4)
!128 = !DILocation(line: 104, column: 12, scope: !126)
!129 = !DILocation(line: 105, column: 10, scope: !126)
!130 = !DILocation(line: 106, column: 8, scope: !131)
!131 = distinct !DILexicalBlock(scope: !126, file: !15, line: 106, column: 8)
!132 = !DILocation(line: 106, column: 8, scope: !126)
!133 = !DILocalVariable(name: "dataBuffer", scope: !134, file: !15, line: 109, type: !4)
!134 = distinct !DILexicalBlock(scope: !135, file: !15, line: 108, column: 9)
!135 = distinct !DILexicalBlock(scope: !131, file: !15, line: 107, column: 5)
!136 = !DILocation(line: 109, column: 20, scope: !134)
!137 = !DILocation(line: 109, column: 41, scope: !134)
!138 = !DILocation(line: 110, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !134, file: !15, line: 110, column: 17)
!140 = !DILocation(line: 110, column: 28, scope: !139)
!141 = !DILocation(line: 110, column: 17, scope: !134)
!142 = !DILocation(line: 110, column: 38, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !15, line: 110, column: 37)
!144 = !DILocation(line: 111, column: 20, scope: !134)
!145 = !DILocation(line: 111, column: 13, scope: !134)
!146 = !DILocation(line: 112, column: 13, scope: !134)
!147 = !DILocation(line: 112, column: 31, scope: !134)
!148 = !DILocation(line: 114, column: 20, scope: !134)
!149 = !DILocation(line: 114, column: 18, scope: !134)
!150 = !DILocation(line: 116, column: 5, scope: !135)
!151 = !DILocalVariable(name: "dest", scope: !152, file: !15, line: 118, type: !45)
!152 = distinct !DILexicalBlock(scope: !126, file: !15, line: 117, column: 5)
!153 = !DILocation(line: 118, column: 14, scope: !152)
!154 = !DILocation(line: 119, column: 9, scope: !152)
!155 = !DILocation(line: 120, column: 9, scope: !152)
!156 = !DILocation(line: 120, column: 23, scope: !152)
!157 = !DILocation(line: 122, column: 16, scope: !152)
!158 = !DILocation(line: 122, column: 22, scope: !152)
!159 = !DILocation(line: 122, column: 9, scope: !152)
!160 = !DILocation(line: 123, column: 19, scope: !152)
!161 = !DILocation(line: 123, column: 9, scope: !152)
!162 = !DILocation(line: 127, column: 1, scope: !126)
