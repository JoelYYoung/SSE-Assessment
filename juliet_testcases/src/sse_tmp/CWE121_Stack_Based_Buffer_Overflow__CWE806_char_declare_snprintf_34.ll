; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_34_unionType = type { i8* }

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_34_unionType, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_34_unionType* %myUnion, metadata !19, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !31
  store i8* %arraydecay, i8** %data, align 8, !dbg !32
  %0 = load i8*, i8** %data, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !34
  %1 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %2 = load i8*, i8** %data, align 8, !dbg !37
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_34_unionType* %myUnion to i8**, !dbg !38
  store i8* %2, i8** %unionFirst, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !40, metadata !DIExpression()), !dbg !42
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_34_unionType* %myUnion to i8**, !dbg !43
  %3 = load i8*, i8** %unionSecond, align 8, !dbg !43
  store i8* %3, i8** %data1, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !44, metadata !DIExpression()), !dbg !49
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !49
  %arraydecay2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !50
  %5 = load i8*, i8** %data1, align 8, !dbg !51
  %call = call i64 @strlen(i8* %5) #6, !dbg !52
  %6 = load i8*, i8** %data1, align 8, !dbg !53
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay2, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %6) #7, !dbg !54
  %7 = load i8*, i8** %data1, align 8, !dbg !55
  call void @printLine(i8* %7), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_34_good() #0 !dbg !58 {
entry:
  call void @goodG2B(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #7, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #7, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_34_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_34_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_34_unionType, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_34_unionType* %myUnion, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !87
  store i8* %arraydecay, i8** %data, align 8, !dbg !88
  %0 = load i8*, i8** %data, align 8, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !90
  %1 = load i8*, i8** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  %2 = load i8*, i8** %data, align 8, !dbg !93
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_34_unionType* %myUnion to i8**, !dbg !94
  store i8* %2, i8** %unionFirst, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !96, metadata !DIExpression()), !dbg !98
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_34_unionType* %myUnion to i8**, !dbg !99
  %3 = load i8*, i8** %unionSecond, align 8, !dbg !99
  store i8* %3, i8** %data1, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !100, metadata !DIExpression()), !dbg !102
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !102
  %arraydecay2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !103
  %5 = load i8*, i8** %data1, align 8, !dbg !104
  %call = call i64 @strlen(i8* %5) #6, !dbg !105
  %6 = load i8*, i8** %data1, align 8, !dbg !106
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay2, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %6) #7, !dbg !107
  %7 = load i8*, i8** %data1, align 8, !dbg !108
  call void @printLine(i8* %7), !dbg !109
  ret void, !dbg !110
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_34.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_34_bad", scope: !12, file: !12, line: 35, type: !13, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_34.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 37, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 37, column: 12, scope: !11)
!19 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 38, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_34_unionType", file: !12, line: 31, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 27, size: 64, elements: !22)
!22 = !{!23, !24}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !21, file: !12, line: 29, baseType: !16, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !21, file: !12, line: 30, baseType: !16, size: 64)
!25 = !DILocation(line: 38, column: 83, scope: !11)
!26 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 39, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 39, column: 10, scope: !11)
!31 = !DILocation(line: 40, column: 12, scope: !11)
!32 = !DILocation(line: 40, column: 10, scope: !11)
!33 = !DILocation(line: 42, column: 12, scope: !11)
!34 = !DILocation(line: 42, column: 5, scope: !11)
!35 = !DILocation(line: 43, column: 5, scope: !11)
!36 = !DILocation(line: 43, column: 17, scope: !11)
!37 = !DILocation(line: 44, column: 26, scope: !11)
!38 = !DILocation(line: 44, column: 13, scope: !11)
!39 = !DILocation(line: 44, column: 24, scope: !11)
!40 = !DILocalVariable(name: "data", scope: !41, file: !12, line: 46, type: !16)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 45, column: 5)
!42 = !DILocation(line: 46, column: 16, scope: !41)
!43 = !DILocation(line: 46, column: 31, scope: !41)
!44 = !DILocalVariable(name: "dest", scope: !45, file: !12, line: 48, type: !46)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 47, column: 9)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 50)
!49 = !DILocation(line: 48, column: 18, scope: !45)
!50 = !DILocation(line: 50, column: 22, scope: !45)
!51 = !DILocation(line: 50, column: 35, scope: !45)
!52 = !DILocation(line: 50, column: 28, scope: !45)
!53 = !DILocation(line: 50, column: 48, scope: !45)
!54 = !DILocation(line: 50, column: 13, scope: !45)
!55 = !DILocation(line: 51, column: 23, scope: !45)
!56 = !DILocation(line: 51, column: 13, scope: !45)
!57 = !DILocation(line: 54, column: 1, scope: !11)
!58 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_34_good", scope: !12, file: !12, line: 82, type: !13, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 84, column: 5, scope: !58)
!60 = !DILocation(line: 85, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 96, type: !62, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!64, !64, !65}
!64 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !12, line: 96, type: !64)
!67 = !DILocation(line: 96, column: 14, scope: !61)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !12, line: 96, type: !65)
!69 = !DILocation(line: 96, column: 27, scope: !61)
!70 = !DILocation(line: 99, column: 22, scope: !61)
!71 = !DILocation(line: 99, column: 12, scope: !61)
!72 = !DILocation(line: 99, column: 5, scope: !61)
!73 = !DILocation(line: 101, column: 5, scope: !61)
!74 = !DILocation(line: 102, column: 5, scope: !61)
!75 = !DILocation(line: 103, column: 5, scope: !61)
!76 = !DILocation(line: 106, column: 5, scope: !61)
!77 = !DILocation(line: 107, column: 5, scope: !61)
!78 = !DILocation(line: 108, column: 5, scope: !61)
!79 = !DILocation(line: 110, column: 5, scope: !61)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !12, line: 63, type: !16)
!82 = !DILocation(line: 63, column: 12, scope: !80)
!83 = !DILocalVariable(name: "myUnion", scope: !80, file: !12, line: 64, type: !20)
!84 = !DILocation(line: 64, column: 83, scope: !80)
!85 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !12, line: 65, type: !27)
!86 = !DILocation(line: 65, column: 10, scope: !80)
!87 = !DILocation(line: 66, column: 12, scope: !80)
!88 = !DILocation(line: 66, column: 10, scope: !80)
!89 = !DILocation(line: 68, column: 12, scope: !80)
!90 = !DILocation(line: 68, column: 5, scope: !80)
!91 = !DILocation(line: 69, column: 5, scope: !80)
!92 = !DILocation(line: 69, column: 16, scope: !80)
!93 = !DILocation(line: 70, column: 26, scope: !80)
!94 = !DILocation(line: 70, column: 13, scope: !80)
!95 = !DILocation(line: 70, column: 24, scope: !80)
!96 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 72, type: !16)
!97 = distinct !DILexicalBlock(scope: !80, file: !12, line: 71, column: 5)
!98 = !DILocation(line: 72, column: 16, scope: !97)
!99 = !DILocation(line: 72, column: 31, scope: !97)
!100 = !DILocalVariable(name: "dest", scope: !101, file: !12, line: 74, type: !46)
!101 = distinct !DILexicalBlock(scope: !97, file: !12, line: 73, column: 9)
!102 = !DILocation(line: 74, column: 18, scope: !101)
!103 = !DILocation(line: 76, column: 22, scope: !101)
!104 = !DILocation(line: 76, column: 35, scope: !101)
!105 = !DILocation(line: 76, column: 28, scope: !101)
!106 = !DILocation(line: 76, column: 48, scope: !101)
!107 = !DILocation(line: 76, column: 13, scope: !101)
!108 = !DILocation(line: 77, column: 23, scope: !101)
!109 = !DILocation(line: 77, column: 13, scope: !101)
!110 = !DILocation(line: 80, column: 1, scope: !80)
