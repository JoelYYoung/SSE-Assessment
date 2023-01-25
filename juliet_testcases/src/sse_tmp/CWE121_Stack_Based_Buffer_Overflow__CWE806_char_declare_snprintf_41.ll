; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_41_badSink(i8* %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !19, metadata !DIExpression()), !dbg !24
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !24
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !25
  %1 = load i8*, i8** %data.addr, align 8, !dbg !26
  %call = call i64 @strlen(i8* %1) #6, !dbg !27
  %2 = load i8*, i8** %data.addr, align 8, !dbg !28
  %call1 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %2) #7, !dbg !29
  %3 = load i8*, i8** %data.addr, align 8, !dbg !30
  call void @printLine(i8* %3), !dbg !31
  ret void, !dbg !32
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_41_bad() #0 !dbg !33 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !38, metadata !DIExpression()), !dbg !42
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !43
  store i8* %arraydecay, i8** %data, align 8, !dbg !44
  %0 = load i8*, i8** %data, align 8, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !46
  %1 = load i8*, i8** %data, align 8, !dbg !47
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !47
  store i8 0, i8* %arrayidx, align 1, !dbg !48
  %2 = load i8*, i8** %data, align 8, !dbg !49
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_41_badSink(i8* %2), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_41_goodG2BSink(i8* %data) #0 !dbg !52 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !55, metadata !DIExpression()), !dbg !57
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !57
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !58
  %1 = load i8*, i8** %data.addr, align 8, !dbg !59
  %call = call i64 @strlen(i8* %1) #6, !dbg !60
  %2 = load i8*, i8** %data.addr, align 8, !dbg !61
  %call1 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %2) #7, !dbg !62
  %3 = load i8*, i8** %data.addr, align 8, !dbg !63
  call void @printLine(i8* %3), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_41_good() #0 !dbg !66 {
entry:
  call void @goodG2B(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !69 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #7, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #7, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_41_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_41_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !93
  store i8* %arraydecay, i8** %data, align 8, !dbg !94
  %0 = load i8*, i8** %data, align 8, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !96
  %1 = load i8*, i8** %data, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !97
  store i8 0, i8* %arrayidx, align 1, !dbg !98
  %2 = load i8*, i8** %data, align 8, !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_41_goodG2BSink(i8* %2), !dbg !100
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_41_badSink", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_41.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 29, type: !15)
!18 = !DILocation(line: 29, column: 89, scope: !11)
!19 = !DILocalVariable(name: "dest", scope: !20, file: !12, line: 32, type: !21)
!20 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 400, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 50)
!24 = !DILocation(line: 32, column: 14, scope: !20)
!25 = !DILocation(line: 34, column: 18, scope: !20)
!26 = !DILocation(line: 34, column: 31, scope: !20)
!27 = !DILocation(line: 34, column: 24, scope: !20)
!28 = !DILocation(line: 34, column: 44, scope: !20)
!29 = !DILocation(line: 34, column: 9, scope: !20)
!30 = !DILocation(line: 35, column: 19, scope: !20)
!31 = !DILocation(line: 35, column: 9, scope: !20)
!32 = !DILocation(line: 37, column: 1, scope: !11)
!33 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_41_bad", scope: !12, file: !12, line: 39, type: !34, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!34 = !DISubroutineType(types: !35)
!35 = !{null}
!36 = !DILocalVariable(name: "data", scope: !33, file: !12, line: 41, type: !15)
!37 = !DILocation(line: 41, column: 12, scope: !33)
!38 = !DILocalVariable(name: "dataBuffer", scope: !33, file: !12, line: 42, type: !39)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 800, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 42, column: 10, scope: !33)
!43 = !DILocation(line: 43, column: 12, scope: !33)
!44 = !DILocation(line: 43, column: 10, scope: !33)
!45 = !DILocation(line: 45, column: 12, scope: !33)
!46 = !DILocation(line: 45, column: 5, scope: !33)
!47 = !DILocation(line: 46, column: 5, scope: !33)
!48 = !DILocation(line: 46, column: 17, scope: !33)
!49 = !DILocation(line: 47, column: 81, scope: !33)
!50 = !DILocation(line: 47, column: 5, scope: !33)
!51 = !DILocation(line: 48, column: 1, scope: !33)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_41_goodG2BSink", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocalVariable(name: "data", arg: 1, scope: !52, file: !12, line: 54, type: !15)
!54 = !DILocation(line: 54, column: 93, scope: !52)
!55 = !DILocalVariable(name: "dest", scope: !56, file: !12, line: 57, type: !21)
!56 = distinct !DILexicalBlock(scope: !52, file: !12, line: 56, column: 5)
!57 = !DILocation(line: 57, column: 14, scope: !56)
!58 = !DILocation(line: 59, column: 18, scope: !56)
!59 = !DILocation(line: 59, column: 31, scope: !56)
!60 = !DILocation(line: 59, column: 24, scope: !56)
!61 = !DILocation(line: 59, column: 44, scope: !56)
!62 = !DILocation(line: 59, column: 9, scope: !56)
!63 = !DILocation(line: 60, column: 19, scope: !56)
!64 = !DILocation(line: 60, column: 9, scope: !56)
!65 = !DILocation(line: 62, column: 1, scope: !52)
!66 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_41_good", scope: !12, file: !12, line: 76, type: !34, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 78, column: 5, scope: !66)
!68 = !DILocation(line: 79, column: 1, scope: !66)
!69 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 91, type: !70, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!72, !72, !73}
!72 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !12, line: 91, type: !72)
!75 = !DILocation(line: 91, column: 14, scope: !69)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !12, line: 91, type: !73)
!77 = !DILocation(line: 91, column: 27, scope: !69)
!78 = !DILocation(line: 94, column: 22, scope: !69)
!79 = !DILocation(line: 94, column: 12, scope: !69)
!80 = !DILocation(line: 94, column: 5, scope: !69)
!81 = !DILocation(line: 96, column: 5, scope: !69)
!82 = !DILocation(line: 97, column: 5, scope: !69)
!83 = !DILocation(line: 98, column: 5, scope: !69)
!84 = !DILocation(line: 101, column: 5, scope: !69)
!85 = !DILocation(line: 102, column: 5, scope: !69)
!86 = !DILocation(line: 103, column: 5, scope: !69)
!87 = !DILocation(line: 105, column: 5, scope: !69)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 65, type: !34, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "data", scope: !88, file: !12, line: 67, type: !15)
!90 = !DILocation(line: 67, column: 12, scope: !88)
!91 = !DILocalVariable(name: "dataBuffer", scope: !88, file: !12, line: 68, type: !39)
!92 = !DILocation(line: 68, column: 10, scope: !88)
!93 = !DILocation(line: 69, column: 12, scope: !88)
!94 = !DILocation(line: 69, column: 10, scope: !88)
!95 = !DILocation(line: 71, column: 12, scope: !88)
!96 = !DILocation(line: 71, column: 5, scope: !88)
!97 = !DILocation(line: 72, column: 5, scope: !88)
!98 = !DILocation(line: 72, column: 16, scope: !88)
!99 = !DILocation(line: 73, column: 85, scope: !88)
!100 = !DILocation(line: 73, column: 5, scope: !88)
!101 = !DILocation(line: 74, column: 1, scope: !88)
