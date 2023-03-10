; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_08.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_08_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
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
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !49
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !50
  store i8 0, i8* %arrayidx4, align 1, !dbg !51
  %4 = load i8*, i8** %data, align 8, !dbg !52
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !53
  %call6 = call i8* @strncpy(i8* %4, i8* %arraydecay5, i64 99) #6, !dbg !54
  %5 = load i8*, i8** %data, align 8, !dbg !55
  %arrayidx7 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !55
  store i8 0, i8* %arrayidx7, align 1, !dbg !56
  %6 = load i8*, i8** %data, align 8, !dbg !57
  call void @printLine(i8* %6), !dbg !58
  ret void, !dbg !59
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
declare dso_local i8* @strncpy(i8*, i8*, i64) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_08_good() #0 !dbg !60 {
entry:
  call void @goodG2B1(), !dbg !61
  call void @goodG2B2(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #6, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #6, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_08_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_08_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !83 {
entry:
  ret i32 1, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !87 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i8* null, i8** %data, align 8, !dbg !90
  %call = call i32 @staticReturnsFalse(), !dbg !91
  %tobool = icmp ne i32 %call, 0, !dbg !91
  br i1 %tobool, label %if.then, label %if.else, !dbg !93

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !94
  br label %if.end3, !dbg !96

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !97, metadata !DIExpression()), !dbg !100
  %call1 = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !101
  store i8* %call1, i8** %dataBuffer, align 8, !dbg !100
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !102
  %cmp = icmp eq i8* %0, null, !dbg !104
  br i1 %cmp, label %if.then2, label %if.end, !dbg !105

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !106
  unreachable, !dbg !106

if.end:                                           ; preds = %if.else
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !109
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !110
  store i8 0, i8* %arrayidx, align 1, !dbg !111
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !112
  store i8* %3, i8** %data, align 8, !dbg !113
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !114, metadata !DIExpression()), !dbg !116
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !117
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !118
  store i8 0, i8* %arrayidx4, align 1, !dbg !119
  %4 = load i8*, i8** %data, align 8, !dbg !120
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !121
  %call6 = call i8* @strncpy(i8* %4, i8* %arraydecay5, i64 99) #6, !dbg !122
  %5 = load i8*, i8** %data, align 8, !dbg !123
  %arrayidx7 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !123
  store i8 0, i8* %arrayidx7, align 1, !dbg !124
  %6 = load i8*, i8** %data, align 8, !dbg !125
  call void @printLine(i8* %6), !dbg !126
  ret void, !dbg !127
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !128 {
entry:
  ret i32 0, !dbg !129
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !130 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !131, metadata !DIExpression()), !dbg !132
  store i8* null, i8** %data, align 8, !dbg !133
  %call = call i32 @staticReturnsTrue(), !dbg !134
  %tobool = icmp ne i32 %call, 0, !dbg !134
  br i1 %tobool, label %if.then, label %if.end3, !dbg !136

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !137, metadata !DIExpression()), !dbg !140
  %call1 = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !141
  store i8* %call1, i8** %dataBuffer, align 8, !dbg !140
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !142
  %cmp = icmp eq i8* %0, null, !dbg !144
  br i1 %cmp, label %if.then2, label %if.end, !dbg !145

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !146
  unreachable, !dbg !146

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !148
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !149
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !150
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !150
  store i8 0, i8* %arrayidx, align 1, !dbg !151
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !152
  store i8* %3, i8** %data, align 8, !dbg !153
  br label %if.end3, !dbg !154

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !155, metadata !DIExpression()), !dbg !157
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !158
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !158
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !159
  store i8 0, i8* %arrayidx4, align 1, !dbg !160
  %4 = load i8*, i8** %data, align 8, !dbg !161
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !162
  %call6 = call i8* @strncpy(i8* %4, i8* %arraydecay5, i64 99) #6, !dbg !163
  %5 = load i8*, i8** %data, align 8, !dbg !164
  %arrayidx7 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !164
  store i8 0, i8* %arrayidx7, align 1, !dbg !165
  %6 = load i8*, i8** %data, align 8, !dbg !166
  call void @printLine(i8* %6), !dbg !167
  ret void, !dbg !168
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_08_bad", scope: !15, file: !15, line: 37, type: !16, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!43 = !DILocalVariable(name: "source", scope: !44, file: !15, line: 53, type: !45)
!44 = distinct !DILexicalBlock(scope: !14, file: !15, line: 52, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 53, column: 14, scope: !44)
!49 = !DILocation(line: 54, column: 9, scope: !44)
!50 = !DILocation(line: 55, column: 9, scope: !44)
!51 = !DILocation(line: 55, column: 23, scope: !44)
!52 = !DILocation(line: 57, column: 17, scope: !44)
!53 = !DILocation(line: 57, column: 23, scope: !44)
!54 = !DILocation(line: 57, column: 9, scope: !44)
!55 = !DILocation(line: 59, column: 9, scope: !44)
!56 = !DILocation(line: 59, column: 21, scope: !44)
!57 = !DILocation(line: 60, column: 19, scope: !44)
!58 = !DILocation(line: 60, column: 9, scope: !44)
!59 = !DILocation(line: 64, column: 1, scope: !14)
!60 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_08_good", scope: !15, file: !15, line: 135, type: !16, scopeLine: 136, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 137, column: 5, scope: !60)
!62 = !DILocation(line: 138, column: 5, scope: !60)
!63 = !DILocation(line: 139, column: 1, scope: !60)
!64 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 151, type: !65, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!67, !67, !68}
!67 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !15, line: 151, type: !67)
!70 = !DILocation(line: 151, column: 14, scope: !64)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !15, line: 151, type: !68)
!72 = !DILocation(line: 151, column: 27, scope: !64)
!73 = !DILocation(line: 154, column: 22, scope: !64)
!74 = !DILocation(line: 154, column: 12, scope: !64)
!75 = !DILocation(line: 154, column: 5, scope: !64)
!76 = !DILocation(line: 156, column: 5, scope: !64)
!77 = !DILocation(line: 157, column: 5, scope: !64)
!78 = !DILocation(line: 158, column: 5, scope: !64)
!79 = !DILocation(line: 161, column: 5, scope: !64)
!80 = !DILocation(line: 162, column: 5, scope: !64)
!81 = !DILocation(line: 163, column: 5, scope: !64)
!82 = !DILocation(line: 165, column: 5, scope: !64)
!83 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 25, type: !84, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!67}
!86 = !DILocation(line: 27, column: 5, scope: !83)
!87 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 71, type: !16, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !15, line: 73, type: !4)
!89 = !DILocation(line: 73, column: 12, scope: !87)
!90 = !DILocation(line: 74, column: 10, scope: !87)
!91 = !DILocation(line: 75, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !87, file: !15, line: 75, column: 8)
!93 = !DILocation(line: 75, column: 8, scope: !87)
!94 = !DILocation(line: 78, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !15, line: 76, column: 5)
!96 = !DILocation(line: 79, column: 5, scope: !95)
!97 = !DILocalVariable(name: "dataBuffer", scope: !98, file: !15, line: 83, type: !4)
!98 = distinct !DILexicalBlock(scope: !99, file: !15, line: 82, column: 9)
!99 = distinct !DILexicalBlock(scope: !92, file: !15, line: 81, column: 5)
!100 = !DILocation(line: 83, column: 20, scope: !98)
!101 = !DILocation(line: 83, column: 41, scope: !98)
!102 = !DILocation(line: 84, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !98, file: !15, line: 84, column: 17)
!104 = !DILocation(line: 84, column: 28, scope: !103)
!105 = !DILocation(line: 84, column: 17, scope: !98)
!106 = !DILocation(line: 84, column: 38, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !15, line: 84, column: 37)
!108 = !DILocation(line: 85, column: 20, scope: !98)
!109 = !DILocation(line: 85, column: 13, scope: !98)
!110 = !DILocation(line: 86, column: 13, scope: !98)
!111 = !DILocation(line: 86, column: 31, scope: !98)
!112 = !DILocation(line: 88, column: 20, scope: !98)
!113 = !DILocation(line: 88, column: 18, scope: !98)
!114 = !DILocalVariable(name: "source", scope: !115, file: !15, line: 92, type: !45)
!115 = distinct !DILexicalBlock(scope: !87, file: !15, line: 91, column: 5)
!116 = !DILocation(line: 92, column: 14, scope: !115)
!117 = !DILocation(line: 93, column: 9, scope: !115)
!118 = !DILocation(line: 94, column: 9, scope: !115)
!119 = !DILocation(line: 94, column: 23, scope: !115)
!120 = !DILocation(line: 96, column: 17, scope: !115)
!121 = !DILocation(line: 96, column: 23, scope: !115)
!122 = !DILocation(line: 96, column: 9, scope: !115)
!123 = !DILocation(line: 98, column: 9, scope: !115)
!124 = !DILocation(line: 98, column: 21, scope: !115)
!125 = !DILocation(line: 99, column: 19, scope: !115)
!126 = !DILocation(line: 99, column: 9, scope: !115)
!127 = !DILocation(line: 103, column: 1, scope: !87)
!128 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 30, type: !84, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!129 = !DILocation(line: 32, column: 5, scope: !128)
!130 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 106, type: !16, scopeLine: 107, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!131 = !DILocalVariable(name: "data", scope: !130, file: !15, line: 108, type: !4)
!132 = !DILocation(line: 108, column: 12, scope: !130)
!133 = !DILocation(line: 109, column: 10, scope: !130)
!134 = !DILocation(line: 110, column: 8, scope: !135)
!135 = distinct !DILexicalBlock(scope: !130, file: !15, line: 110, column: 8)
!136 = !DILocation(line: 110, column: 8, scope: !130)
!137 = !DILocalVariable(name: "dataBuffer", scope: !138, file: !15, line: 113, type: !4)
!138 = distinct !DILexicalBlock(scope: !139, file: !15, line: 112, column: 9)
!139 = distinct !DILexicalBlock(scope: !135, file: !15, line: 111, column: 5)
!140 = !DILocation(line: 113, column: 20, scope: !138)
!141 = !DILocation(line: 113, column: 41, scope: !138)
!142 = !DILocation(line: 114, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !138, file: !15, line: 114, column: 17)
!144 = !DILocation(line: 114, column: 28, scope: !143)
!145 = !DILocation(line: 114, column: 17, scope: !138)
!146 = !DILocation(line: 114, column: 38, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !15, line: 114, column: 37)
!148 = !DILocation(line: 115, column: 20, scope: !138)
!149 = !DILocation(line: 115, column: 13, scope: !138)
!150 = !DILocation(line: 116, column: 13, scope: !138)
!151 = !DILocation(line: 116, column: 31, scope: !138)
!152 = !DILocation(line: 118, column: 20, scope: !138)
!153 = !DILocation(line: 118, column: 18, scope: !138)
!154 = !DILocation(line: 120, column: 5, scope: !139)
!155 = !DILocalVariable(name: "source", scope: !156, file: !15, line: 122, type: !45)
!156 = distinct !DILexicalBlock(scope: !130, file: !15, line: 121, column: 5)
!157 = !DILocation(line: 122, column: 14, scope: !156)
!158 = !DILocation(line: 123, column: 9, scope: !156)
!159 = !DILocation(line: 124, column: 9, scope: !156)
!160 = !DILocation(line: 124, column: 23, scope: !156)
!161 = !DILocation(line: 126, column: 17, scope: !156)
!162 = !DILocation(line: 126, column: 23, scope: !156)
!163 = !DILocation(line: 126, column: 9, scope: !156)
!164 = !DILocation(line: 128, column: 9, scope: !156)
!165 = !DILocation(line: 128, column: 21, scope: !156)
!166 = !DILocation(line: 129, column: 19, scope: !156)
!167 = !DILocation(line: 129, column: 9, scope: !156)
!168 = !DILocation(line: 133, column: 1, scope: !130)
