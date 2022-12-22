; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  store i8* %arraydecay, i8** %data, align 8, !dbg !25
  %0 = load i8*, i8** %data, align 8, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !27
  %1 = load i8*, i8** %data, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !30, metadata !DIExpression()), !dbg !32
  %2 = load i8*, i8** %data, align 8, !dbg !33
  store i8* %2, i8** %dataCopy, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !34, metadata !DIExpression()), !dbg !35
  %3 = load i8*, i8** %dataCopy, align 8, !dbg !36
  store i8* %3, i8** %data1, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !42
  %arraydecay2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !43
  %5 = load i8*, i8** %data1, align 8, !dbg !44
  %call = call i64 @strlen(i8* %5) #6, !dbg !45
  %6 = load i8*, i8** %data1, align 8, !dbg !46
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay2, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %6) #7, !dbg !47
  %7 = load i8*, i8** %data1, align 8, !dbg !48
  call void @printLine(i8* %7), !dbg !49
  ret void, !dbg !50
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_31_good() #0 !dbg !51 {
entry:
  call void @goodG2B(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #7, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #7, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_31_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_31_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !73 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !78
  store i8* %arraydecay, i8** %data, align 8, !dbg !79
  %0 = load i8*, i8** %data, align 8, !dbg !80
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !81
  %1 = load i8*, i8** %data, align 8, !dbg !82
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !82
  store i8 0, i8* %arrayidx, align 1, !dbg !83
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !84, metadata !DIExpression()), !dbg !86
  %2 = load i8*, i8** %data, align 8, !dbg !87
  store i8* %2, i8** %dataCopy, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !88, metadata !DIExpression()), !dbg !89
  %3 = load i8*, i8** %dataCopy, align 8, !dbg !90
  store i8* %3, i8** %data1, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !91, metadata !DIExpression()), !dbg !93
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !93
  %arraydecay2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !94
  %5 = load i8*, i8** %data1, align 8, !dbg !95
  %call = call i64 @strlen(i8* %5) #6, !dbg !96
  %6 = load i8*, i8** %data1, align 8, !dbg !97
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay2, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %6) #7, !dbg !98
  %7 = load i8*, i8** %data1, align 8, !dbg !99
  call void @printLine(i8* %7), !dbg !100
  ret void, !dbg !101
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_31.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_31_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_31.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 31, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 32, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 32, column: 10, scope: !11)
!24 = !DILocation(line: 33, column: 12, scope: !11)
!25 = !DILocation(line: 33, column: 10, scope: !11)
!26 = !DILocation(line: 35, column: 12, scope: !11)
!27 = !DILocation(line: 35, column: 5, scope: !11)
!28 = !DILocation(line: 36, column: 5, scope: !11)
!29 = !DILocation(line: 36, column: 17, scope: !11)
!30 = !DILocalVariable(name: "dataCopy", scope: !31, file: !12, line: 38, type: !16)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!32 = !DILocation(line: 38, column: 16, scope: !31)
!33 = !DILocation(line: 38, column: 27, scope: !31)
!34 = !DILocalVariable(name: "data", scope: !31, file: !12, line: 39, type: !16)
!35 = !DILocation(line: 39, column: 16, scope: !31)
!36 = !DILocation(line: 39, column: 23, scope: !31)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !12, line: 41, type: !39)
!38 = distinct !DILexicalBlock(scope: !31, file: !12, line: 40, column: 9)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 41, column: 18, scope: !38)
!43 = !DILocation(line: 43, column: 22, scope: !38)
!44 = !DILocation(line: 43, column: 35, scope: !38)
!45 = !DILocation(line: 43, column: 28, scope: !38)
!46 = !DILocation(line: 43, column: 48, scope: !38)
!47 = !DILocation(line: 43, column: 13, scope: !38)
!48 = !DILocation(line: 44, column: 23, scope: !38)
!49 = !DILocation(line: 44, column: 13, scope: !38)
!50 = !DILocation(line: 47, column: 1, scope: !11)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_31_good", scope: !12, file: !12, line: 74, type: !13, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 76, column: 5, scope: !51)
!53 = !DILocation(line: 77, column: 1, scope: !51)
!54 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 88, type: !55, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !12, line: 88, type: !57)
!60 = !DILocation(line: 88, column: 14, scope: !54)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !12, line: 88, type: !58)
!62 = !DILocation(line: 88, column: 27, scope: !54)
!63 = !DILocation(line: 91, column: 22, scope: !54)
!64 = !DILocation(line: 91, column: 12, scope: !54)
!65 = !DILocation(line: 91, column: 5, scope: !54)
!66 = !DILocation(line: 93, column: 5, scope: !54)
!67 = !DILocation(line: 94, column: 5, scope: !54)
!68 = !DILocation(line: 95, column: 5, scope: !54)
!69 = !DILocation(line: 98, column: 5, scope: !54)
!70 = !DILocation(line: 99, column: 5, scope: !54)
!71 = !DILocation(line: 100, column: 5, scope: !54)
!72 = !DILocation(line: 102, column: 5, scope: !54)
!73 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !12, line: 56, type: !16)
!75 = !DILocation(line: 56, column: 12, scope: !73)
!76 = !DILocalVariable(name: "dataBuffer", scope: !73, file: !12, line: 57, type: !20)
!77 = !DILocation(line: 57, column: 10, scope: !73)
!78 = !DILocation(line: 58, column: 12, scope: !73)
!79 = !DILocation(line: 58, column: 10, scope: !73)
!80 = !DILocation(line: 60, column: 12, scope: !73)
!81 = !DILocation(line: 60, column: 5, scope: !73)
!82 = !DILocation(line: 61, column: 5, scope: !73)
!83 = !DILocation(line: 61, column: 16, scope: !73)
!84 = !DILocalVariable(name: "dataCopy", scope: !85, file: !12, line: 63, type: !16)
!85 = distinct !DILexicalBlock(scope: !73, file: !12, line: 62, column: 5)
!86 = !DILocation(line: 63, column: 16, scope: !85)
!87 = !DILocation(line: 63, column: 27, scope: !85)
!88 = !DILocalVariable(name: "data", scope: !85, file: !12, line: 64, type: !16)
!89 = !DILocation(line: 64, column: 16, scope: !85)
!90 = !DILocation(line: 64, column: 23, scope: !85)
!91 = !DILocalVariable(name: "dest", scope: !92, file: !12, line: 66, type: !39)
!92 = distinct !DILexicalBlock(scope: !85, file: !12, line: 65, column: 9)
!93 = !DILocation(line: 66, column: 18, scope: !92)
!94 = !DILocation(line: 68, column: 22, scope: !92)
!95 = !DILocation(line: 68, column: 35, scope: !92)
!96 = !DILocation(line: 68, column: 28, scope: !92)
!97 = !DILocation(line: 68, column: 48, scope: !92)
!98 = !DILocation(line: 68, column: 13, scope: !92)
!99 = !DILocation(line: 69, column: 23, scope: !92)
!100 = !DILocation(line: 69, column: 13, scope: !92)
!101 = !DILocation(line: 72, column: 1, scope: !73)
