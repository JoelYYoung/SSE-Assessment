; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_10.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_10_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  store i8* %arraydecay, i8** %data, align 8, !dbg !25
  %0 = load i32, i32* @globalTrue, align 4, !dbg !26
  %tobool = icmp ne i32 %0, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !31
  %2 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !40
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !41
  %4 = load i8*, i8** %data, align 8, !dbg !42
  %call = call i8* @strcpy(i8* %arraydecay1, i8* %4) #5, !dbg !43
  %5 = load i8*, i8** %data, align 8, !dbg !44
  call void @printLine(i8* %5), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_10_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* null) #5, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #5, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_10_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_10_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !70 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !75
  store i8* %arraydecay, i8** %data, align 8, !dbg !76
  %0 = load i32, i32* @globalFalse, align 4, !dbg !77
  %tobool = icmp ne i32 %0, 0, !dbg !77
  br i1 %tobool, label %if.then, label %if.else, !dbg !79

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !80
  br label %if.end, !dbg !82

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !85
  %2 = load i8*, i8** %data, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !86
  store i8 0, i8* %arrayidx, align 1, !dbg !87
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !88, metadata !DIExpression()), !dbg !90
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !90
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !91
  %4 = load i8*, i8** %data, align 8, !dbg !92
  %call = call i8* @strcpy(i8* %arraydecay1, i8* %4) #5, !dbg !93
  %5 = load i8*, i8** %data, align 8, !dbg !94
  call void @printLine(i8* %5), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !97 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !102
  store i8* %arraydecay, i8** %data, align 8, !dbg !103
  %0 = load i32, i32* @globalTrue, align 4, !dbg !104
  %tobool = icmp ne i32 %0, 0, !dbg !104
  br i1 %tobool, label %if.then, label %if.end, !dbg !106

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !109
  %2 = load i8*, i8** %data, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !110
  store i8 0, i8* %arrayidx, align 1, !dbg !111
  br label %if.end, !dbg !112

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !113, metadata !DIExpression()), !dbg !115
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !115
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !116
  %4 = load i8*, i8** %data, align 8, !dbg !117
  %call = call i8* @strcpy(i8* %arraydecay1, i8* %4) #5, !dbg !118
  %5 = load i8*, i8** %data, align 8, !dbg !119
  call void @printLine(i8* %5), !dbg !120
  ret void, !dbg !121
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_10.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_10_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_10.c", directory: "/root/SSE-Assessment")
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
!24 = !DILocation(line: 27, column: 12, scope: !11)
!25 = !DILocation(line: 27, column: 10, scope: !11)
!26 = !DILocation(line: 28, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!28 = !DILocation(line: 28, column: 8, scope: !11)
!29 = !DILocation(line: 31, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !12, line: 29, column: 5)
!31 = !DILocation(line: 31, column: 9, scope: !30)
!32 = !DILocation(line: 32, column: 9, scope: !30)
!33 = !DILocation(line: 32, column: 21, scope: !30)
!34 = !DILocation(line: 33, column: 5, scope: !30)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !12, line: 35, type: !37)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 35, column: 14, scope: !36)
!41 = !DILocation(line: 37, column: 16, scope: !36)
!42 = !DILocation(line: 37, column: 22, scope: !36)
!43 = !DILocation(line: 37, column: 9, scope: !36)
!44 = !DILocation(line: 38, column: 19, scope: !36)
!45 = !DILocation(line: 38, column: 9, scope: !36)
!46 = !DILocation(line: 40, column: 1, scope: !11)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_10_good", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 93, column: 5, scope: !47)
!49 = !DILocation(line: 94, column: 5, scope: !47)
!50 = !DILocation(line: 95, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 107, type: !52, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !12, line: 107, type: !54)
!57 = !DILocation(line: 107, column: 14, scope: !51)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !12, line: 107, type: !55)
!59 = !DILocation(line: 107, column: 27, scope: !51)
!60 = !DILocation(line: 110, column: 22, scope: !51)
!61 = !DILocation(line: 110, column: 12, scope: !51)
!62 = !DILocation(line: 110, column: 5, scope: !51)
!63 = !DILocation(line: 112, column: 5, scope: !51)
!64 = !DILocation(line: 113, column: 5, scope: !51)
!65 = !DILocation(line: 114, column: 5, scope: !51)
!66 = !DILocation(line: 117, column: 5, scope: !51)
!67 = !DILocation(line: 118, column: 5, scope: !51)
!68 = !DILocation(line: 119, column: 5, scope: !51)
!69 = !DILocation(line: 121, column: 5, scope: !51)
!70 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 47, type: !13, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "data", scope: !70, file: !12, line: 49, type: !16)
!72 = !DILocation(line: 49, column: 12, scope: !70)
!73 = !DILocalVariable(name: "dataBuffer", scope: !70, file: !12, line: 50, type: !20)
!74 = !DILocation(line: 50, column: 10, scope: !70)
!75 = !DILocation(line: 51, column: 12, scope: !70)
!76 = !DILocation(line: 51, column: 10, scope: !70)
!77 = !DILocation(line: 52, column: 8, scope: !78)
!78 = distinct !DILexicalBlock(scope: !70, file: !12, line: 52, column: 8)
!79 = !DILocation(line: 52, column: 8, scope: !70)
!80 = !DILocation(line: 55, column: 9, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !12, line: 53, column: 5)
!82 = !DILocation(line: 56, column: 5, scope: !81)
!83 = !DILocation(line: 60, column: 16, scope: !84)
!84 = distinct !DILexicalBlock(scope: !78, file: !12, line: 58, column: 5)
!85 = !DILocation(line: 60, column: 9, scope: !84)
!86 = !DILocation(line: 61, column: 9, scope: !84)
!87 = !DILocation(line: 61, column: 20, scope: !84)
!88 = !DILocalVariable(name: "dest", scope: !89, file: !12, line: 64, type: !37)
!89 = distinct !DILexicalBlock(scope: !70, file: !12, line: 63, column: 5)
!90 = !DILocation(line: 64, column: 14, scope: !89)
!91 = !DILocation(line: 66, column: 16, scope: !89)
!92 = !DILocation(line: 66, column: 22, scope: !89)
!93 = !DILocation(line: 66, column: 9, scope: !89)
!94 = !DILocation(line: 67, column: 19, scope: !89)
!95 = !DILocation(line: 67, column: 9, scope: !89)
!96 = !DILocation(line: 69, column: 1, scope: !70)
!97 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 72, type: !13, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 74, type: !16)
!99 = !DILocation(line: 74, column: 12, scope: !97)
!100 = !DILocalVariable(name: "dataBuffer", scope: !97, file: !12, line: 75, type: !20)
!101 = !DILocation(line: 75, column: 10, scope: !97)
!102 = !DILocation(line: 76, column: 12, scope: !97)
!103 = !DILocation(line: 76, column: 10, scope: !97)
!104 = !DILocation(line: 77, column: 8, scope: !105)
!105 = distinct !DILexicalBlock(scope: !97, file: !12, line: 77, column: 8)
!106 = !DILocation(line: 77, column: 8, scope: !97)
!107 = !DILocation(line: 80, column: 16, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !12, line: 78, column: 5)
!109 = !DILocation(line: 80, column: 9, scope: !108)
!110 = !DILocation(line: 81, column: 9, scope: !108)
!111 = !DILocation(line: 81, column: 20, scope: !108)
!112 = !DILocation(line: 82, column: 5, scope: !108)
!113 = !DILocalVariable(name: "dest", scope: !114, file: !12, line: 84, type: !37)
!114 = distinct !DILexicalBlock(scope: !97, file: !12, line: 83, column: 5)
!115 = !DILocation(line: 84, column: 14, scope: !114)
!116 = !DILocation(line: 86, column: 16, scope: !114)
!117 = !DILocation(line: 86, column: 22, scope: !114)
!118 = !DILocation(line: 86, column: 9, scope: !114)
!119 = !DILocation(line: 87, column: 19, scope: !114)
!120 = !DILocation(line: 87, column: 9, scope: !114)
!121 = !DILocation(line: 89, column: 1, scope: !97)
