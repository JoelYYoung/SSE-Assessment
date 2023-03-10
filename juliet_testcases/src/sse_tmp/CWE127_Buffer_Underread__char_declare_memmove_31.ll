; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_memmove_31.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_memmove_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_memmove_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dataCopy = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !24
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !25
  store i8 0, i8* %arrayidx, align 1, !dbg !26
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !27
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !28
  store i8* %add.ptr, i8** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !30, metadata !DIExpression()), !dbg !32
  %0 = load i8*, i8** %data, align 8, !dbg !33
  store i8* %0, i8** %dataCopy, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !34, metadata !DIExpression()), !dbg !35
  %1 = load i8*, i8** %dataCopy, align 8, !dbg !36
  store i8* %1, i8** %data2, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !37, metadata !DIExpression()), !dbg !39
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay3, i8 67, i64 99, i1 false), !dbg !40
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !41
  store i8 0, i8* %arrayidx4, align 1, !dbg !42
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !43
  %2 = load i8*, i8** %data2, align 8, !dbg !44
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay5, i8* align 1 %2, i64 100, i1 false), !dbg !43
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !45
  store i8 0, i8* %arrayidx6, align 1, !dbg !46
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !47
  call void @printLine(i8* %arraydecay7), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_memmove_31_good() #0 !dbg !50 {
entry:
  call void @goodG2B(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #6, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #6, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE127_Buffer_Underread__char_declare_memmove_31_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE127_Buffer_Underread__char_declare_memmove_31_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !72 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dataCopy = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !77
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !77
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !78
  store i8 0, i8* %arrayidx, align 1, !dbg !79
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !80
  store i8* %arraydecay1, i8** %data, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !82, metadata !DIExpression()), !dbg !84
  %0 = load i8*, i8** %data, align 8, !dbg !85
  store i8* %0, i8** %dataCopy, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !86, metadata !DIExpression()), !dbg !87
  %1 = load i8*, i8** %dataCopy, align 8, !dbg !88
  store i8* %1, i8** %data2, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !89, metadata !DIExpression()), !dbg !91
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay3, i8 67, i64 99, i1 false), !dbg !92
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !93
  store i8 0, i8* %arrayidx4, align 1, !dbg !94
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !95
  %2 = load i8*, i8** %data2, align 8, !dbg !96
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay5, i8* align 1 %2, i64 100, i1 false), !dbg !95
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !97
  store i8 0, i8* %arrayidx6, align 1, !dbg !98
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !99
  call void @printLine(i8* %arraydecay7), !dbg !100
  ret void, !dbg !101
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_memmove_31.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_memmove_31_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_memmove_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!24 = !DILocation(line: 27, column: 5, scope: !11)
!25 = !DILocation(line: 28, column: 5, scope: !11)
!26 = !DILocation(line: 28, column: 23, scope: !11)
!27 = !DILocation(line: 30, column: 12, scope: !11)
!28 = !DILocation(line: 30, column: 23, scope: !11)
!29 = !DILocation(line: 30, column: 10, scope: !11)
!30 = !DILocalVariable(name: "dataCopy", scope: !31, file: !12, line: 32, type: !16)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!32 = !DILocation(line: 32, column: 16, scope: !31)
!33 = !DILocation(line: 32, column: 27, scope: !31)
!34 = !DILocalVariable(name: "data", scope: !31, file: !12, line: 33, type: !16)
!35 = !DILocation(line: 33, column: 16, scope: !31)
!36 = !DILocation(line: 33, column: 23, scope: !31)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !12, line: 35, type: !20)
!38 = distinct !DILexicalBlock(scope: !31, file: !12, line: 34, column: 9)
!39 = !DILocation(line: 35, column: 18, scope: !38)
!40 = !DILocation(line: 36, column: 13, scope: !38)
!41 = !DILocation(line: 37, column: 13, scope: !38)
!42 = !DILocation(line: 37, column: 25, scope: !38)
!43 = !DILocation(line: 39, column: 13, scope: !38)
!44 = !DILocation(line: 39, column: 27, scope: !38)
!45 = !DILocation(line: 41, column: 13, scope: !38)
!46 = !DILocation(line: 41, column: 25, scope: !38)
!47 = !DILocation(line: 42, column: 23, scope: !38)
!48 = !DILocation(line: 42, column: 13, scope: !38)
!49 = !DILocation(line: 45, column: 1, scope: !11)
!50 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_memmove_31_good", scope: !12, file: !12, line: 76, type: !13, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 78, column: 5, scope: !50)
!52 = !DILocation(line: 79, column: 1, scope: !50)
!53 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 90, type: !54, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56, !57}
!56 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !12, line: 90, type: !56)
!59 = !DILocation(line: 90, column: 14, scope: !53)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !12, line: 90, type: !57)
!61 = !DILocation(line: 90, column: 27, scope: !53)
!62 = !DILocation(line: 93, column: 22, scope: !53)
!63 = !DILocation(line: 93, column: 12, scope: !53)
!64 = !DILocation(line: 93, column: 5, scope: !53)
!65 = !DILocation(line: 95, column: 5, scope: !53)
!66 = !DILocation(line: 96, column: 5, scope: !53)
!67 = !DILocation(line: 97, column: 5, scope: !53)
!68 = !DILocation(line: 100, column: 5, scope: !53)
!69 = !DILocation(line: 101, column: 5, scope: !53)
!70 = !DILocation(line: 102, column: 5, scope: !53)
!71 = !DILocation(line: 104, column: 5, scope: !53)
!72 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "data", scope: !72, file: !12, line: 54, type: !16)
!74 = !DILocation(line: 54, column: 12, scope: !72)
!75 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !12, line: 55, type: !20)
!76 = !DILocation(line: 55, column: 10, scope: !72)
!77 = !DILocation(line: 56, column: 5, scope: !72)
!78 = !DILocation(line: 57, column: 5, scope: !72)
!79 = !DILocation(line: 57, column: 23, scope: !72)
!80 = !DILocation(line: 59, column: 12, scope: !72)
!81 = !DILocation(line: 59, column: 10, scope: !72)
!82 = !DILocalVariable(name: "dataCopy", scope: !83, file: !12, line: 61, type: !16)
!83 = distinct !DILexicalBlock(scope: !72, file: !12, line: 60, column: 5)
!84 = !DILocation(line: 61, column: 16, scope: !83)
!85 = !DILocation(line: 61, column: 27, scope: !83)
!86 = !DILocalVariable(name: "data", scope: !83, file: !12, line: 62, type: !16)
!87 = !DILocation(line: 62, column: 16, scope: !83)
!88 = !DILocation(line: 62, column: 23, scope: !83)
!89 = !DILocalVariable(name: "dest", scope: !90, file: !12, line: 64, type: !20)
!90 = distinct !DILexicalBlock(scope: !83, file: !12, line: 63, column: 9)
!91 = !DILocation(line: 64, column: 18, scope: !90)
!92 = !DILocation(line: 65, column: 13, scope: !90)
!93 = !DILocation(line: 66, column: 13, scope: !90)
!94 = !DILocation(line: 66, column: 25, scope: !90)
!95 = !DILocation(line: 68, column: 13, scope: !90)
!96 = !DILocation(line: 68, column: 27, scope: !90)
!97 = !DILocation(line: 70, column: 13, scope: !90)
!98 = !DILocation(line: 70, column: 25, scope: !90)
!99 = !DILocation(line: 71, column: 23, scope: !90)
!100 = !DILocation(line: 71, column: 13, scope: !90)
!101 = !DILocation(line: 74, column: 1, scope: !72)
