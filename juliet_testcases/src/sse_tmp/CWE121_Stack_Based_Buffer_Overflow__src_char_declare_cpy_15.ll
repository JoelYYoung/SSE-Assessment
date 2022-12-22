; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
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
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !30, metadata !DIExpression()), !dbg !35
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !35
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !36
  %3 = load i8*, i8** %data, align 8, !dbg !37
  %call = call i8* @strcpy(i8* %arraydecay1, i8* %3) #5, !dbg !38
  %4 = load i8*, i8** %data, align 8, !dbg !39
  call void @printLine(i8* %4), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_15_good() #0 !dbg !42 {
entry:
  call void @goodG2B1(), !dbg !43
  call void @goodG2B2(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* null) #5, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #5, !dbg !57
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_15_good(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_15_bad(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !65 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !68, metadata !DIExpression()), !dbg !69
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !70
  store i8* %arraydecay, i8** %data, align 8, !dbg !71
  %0 = load i8*, i8** %data, align 8, !dbg !72
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !73
  %1 = load i8*, i8** %data, align 8, !dbg !74
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !74
  store i8 0, i8* %arrayidx, align 1, !dbg !75
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !76, metadata !DIExpression()), !dbg !78
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !78
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !78
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !79
  %3 = load i8*, i8** %data, align 8, !dbg !80
  %call = call i8* @strcpy(i8* %arraydecay1, i8* %3) #5, !dbg !81
  %4 = load i8*, i8** %data, align 8, !dbg !82
  call void @printLine(i8* %4), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !85 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !90
  store i8* %arraydecay, i8** %data, align 8, !dbg !91
  %0 = load i8*, i8** %data, align 8, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !93
  %1 = load i8*, i8** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !94
  store i8 0, i8* %arrayidx, align 1, !dbg !95
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !96, metadata !DIExpression()), !dbg !98
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !98
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !99
  %3 = load i8*, i8** %data, align 8, !dbg !100
  %call = call i8* @strcpy(i8* %arraydecay1, i8* %3) #5, !dbg !101
  %4 = load i8*, i8** %data, align 8, !dbg !102
  call void @printLine(i8* %4), !dbg !103
  ret void, !dbg !104
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_15.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_15_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_15.c", directory: "/root/SSE-Assessment")
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
!26 = !DILocation(line: 32, column: 16, scope: !11)
!27 = !DILocation(line: 32, column: 9, scope: !11)
!28 = !DILocation(line: 33, column: 9, scope: !11)
!29 = !DILocation(line: 33, column: 21, scope: !11)
!30 = !DILocalVariable(name: "dest", scope: !31, file: !12, line: 41, type: !32)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 50)
!35 = !DILocation(line: 41, column: 14, scope: !31)
!36 = !DILocation(line: 43, column: 16, scope: !31)
!37 = !DILocation(line: 43, column: 22, scope: !31)
!38 = !DILocation(line: 43, column: 9, scope: !31)
!39 = !DILocation(line: 44, column: 19, scope: !31)
!40 = !DILocation(line: 44, column: 9, scope: !31)
!41 = !DILocation(line: 46, column: 1, scope: !11)
!42 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_15_good", scope: !12, file: !12, line: 104, type: !13, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 106, column: 5, scope: !42)
!44 = !DILocation(line: 107, column: 5, scope: !42)
!45 = !DILocation(line: 108, column: 1, scope: !42)
!46 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 120, type: !47, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{!49, !49, !50}
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !12, line: 120, type: !49)
!52 = !DILocation(line: 120, column: 14, scope: !46)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !12, line: 120, type: !50)
!54 = !DILocation(line: 120, column: 27, scope: !46)
!55 = !DILocation(line: 123, column: 22, scope: !46)
!56 = !DILocation(line: 123, column: 12, scope: !46)
!57 = !DILocation(line: 123, column: 5, scope: !46)
!58 = !DILocation(line: 125, column: 5, scope: !46)
!59 = !DILocation(line: 126, column: 5, scope: !46)
!60 = !DILocation(line: 127, column: 5, scope: !46)
!61 = !DILocation(line: 130, column: 5, scope: !46)
!62 = !DILocation(line: 131, column: 5, scope: !46)
!63 = !DILocation(line: 132, column: 5, scope: !46)
!64 = !DILocation(line: 134, column: 5, scope: !46)
!65 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocalVariable(name: "data", scope: !65, file: !12, line: 55, type: !16)
!67 = !DILocation(line: 55, column: 12, scope: !65)
!68 = !DILocalVariable(name: "dataBuffer", scope: !65, file: !12, line: 56, type: !20)
!69 = !DILocation(line: 56, column: 10, scope: !65)
!70 = !DILocation(line: 57, column: 12, scope: !65)
!71 = !DILocation(line: 57, column: 10, scope: !65)
!72 = !DILocation(line: 66, column: 16, scope: !65)
!73 = !DILocation(line: 66, column: 9, scope: !65)
!74 = !DILocation(line: 67, column: 9, scope: !65)
!75 = !DILocation(line: 67, column: 20, scope: !65)
!76 = !DILocalVariable(name: "dest", scope: !77, file: !12, line: 71, type: !32)
!77 = distinct !DILexicalBlock(scope: !65, file: !12, line: 70, column: 5)
!78 = !DILocation(line: 71, column: 14, scope: !77)
!79 = !DILocation(line: 73, column: 16, scope: !77)
!80 = !DILocation(line: 73, column: 22, scope: !77)
!81 = !DILocation(line: 73, column: 9, scope: !77)
!82 = !DILocation(line: 74, column: 19, scope: !77)
!83 = !DILocation(line: 74, column: 9, scope: !77)
!84 = !DILocation(line: 76, column: 1, scope: !65)
!85 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !12, line: 81, type: !16)
!87 = !DILocation(line: 81, column: 12, scope: !85)
!88 = !DILocalVariable(name: "dataBuffer", scope: !85, file: !12, line: 82, type: !20)
!89 = !DILocation(line: 82, column: 10, scope: !85)
!90 = !DILocation(line: 83, column: 12, scope: !85)
!91 = !DILocation(line: 83, column: 10, scope: !85)
!92 = !DILocation(line: 88, column: 16, scope: !85)
!93 = !DILocation(line: 88, column: 9, scope: !85)
!94 = !DILocation(line: 89, column: 9, scope: !85)
!95 = !DILocation(line: 89, column: 20, scope: !85)
!96 = !DILocalVariable(name: "dest", scope: !97, file: !12, line: 97, type: !32)
!97 = distinct !DILexicalBlock(scope: !85, file: !12, line: 96, column: 5)
!98 = !DILocation(line: 97, column: 14, scope: !97)
!99 = !DILocation(line: 99, column: 16, scope: !97)
!100 = !DILocation(line: 99, column: 22, scope: !97)
!101 = !DILocation(line: 99, column: 9, scope: !97)
!102 = !DILocation(line: 100, column: 19, scope: !97)
!103 = !DILocation(line: 100, column: 9, scope: !97)
!104 = !DILocation(line: 102, column: 1, scope: !85)
