; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_memmove_01.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_memmove_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_memmove_01_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !24
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !25
  store i8 0, i8* %arrayidx, align 1, !dbg !26
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !27
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !28
  store i8* %add.ptr, i8** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !30, metadata !DIExpression()), !dbg !32
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !33
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !34
  store i8 0, i8* %arrayidx3, align 1, !dbg !35
  %0 = load i8*, i8** %data, align 8, !dbg !36
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !37
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %arraydecay4, i64 100, i1 false), !dbg !37
  %1 = load i8*, i8** %data, align 8, !dbg !38
  %arrayidx5 = getelementptr inbounds i8, i8* %1, i64 99, !dbg !38
  store i8 0, i8* %arrayidx5, align 1, !dbg !39
  %2 = load i8*, i8** %data, align 8, !dbg !40
  call void @printLine(i8* %2), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_memmove_01_good() #0 !dbg !43 {
entry:
  call void @goodG2B(), !dbg !44
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
  %call = call i64 @time(i64* null) #6, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #6, !dbg !57
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE124_Buffer_Underwrite__char_declare_memmove_01_good(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE124_Buffer_Underwrite__char_declare_memmove_01_bad(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !65 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !68, metadata !DIExpression()), !dbg !69
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !70
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !70
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !71
  store i8 0, i8* %arrayidx, align 1, !dbg !72
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !73
  store i8* %arraydecay1, i8** %data, align 8, !dbg !74
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !75, metadata !DIExpression()), !dbg !77
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !78
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !78
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !79
  store i8 0, i8* %arrayidx3, align 1, !dbg !80
  %0 = load i8*, i8** %data, align 8, !dbg !81
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !82
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %arraydecay4, i64 100, i1 false), !dbg !82
  %1 = load i8*, i8** %data, align 8, !dbg !83
  %arrayidx5 = getelementptr inbounds i8, i8* %1, i64 99, !dbg !83
  store i8 0, i8* %arrayidx5, align 1, !dbg !84
  %2 = load i8*, i8** %data, align 8, !dbg !85
  call void @printLine(i8* %2), !dbg !86
  ret void, !dbg !87
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_memmove_01.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_memmove_01_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_memmove_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!30 = !DILocalVariable(name: "source", scope: !31, file: !12, line: 32, type: !20)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!32 = !DILocation(line: 32, column: 14, scope: !31)
!33 = !DILocation(line: 33, column: 9, scope: !31)
!34 = !DILocation(line: 34, column: 9, scope: !31)
!35 = !DILocation(line: 34, column: 23, scope: !31)
!36 = !DILocation(line: 36, column: 17, scope: !31)
!37 = !DILocation(line: 36, column: 9, scope: !31)
!38 = !DILocation(line: 38, column: 9, scope: !31)
!39 = !DILocation(line: 38, column: 21, scope: !31)
!40 = !DILocation(line: 39, column: 19, scope: !31)
!41 = !DILocation(line: 39, column: 9, scope: !31)
!42 = !DILocation(line: 41, column: 1, scope: !11)
!43 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_memmove_01_good", scope: !12, file: !12, line: 68, type: !13, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocation(line: 70, column: 5, scope: !43)
!45 = !DILocation(line: 71, column: 1, scope: !43)
!46 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 83, type: !47, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{!49, !49, !50}
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !12, line: 83, type: !49)
!52 = !DILocation(line: 83, column: 14, scope: !46)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !12, line: 83, type: !50)
!54 = !DILocation(line: 83, column: 27, scope: !46)
!55 = !DILocation(line: 86, column: 22, scope: !46)
!56 = !DILocation(line: 86, column: 12, scope: !46)
!57 = !DILocation(line: 86, column: 5, scope: !46)
!58 = !DILocation(line: 88, column: 5, scope: !46)
!59 = !DILocation(line: 89, column: 5, scope: !46)
!60 = !DILocation(line: 90, column: 5, scope: !46)
!61 = !DILocation(line: 93, column: 5, scope: !46)
!62 = !DILocation(line: 94, column: 5, scope: !46)
!63 = !DILocation(line: 95, column: 5, scope: !46)
!64 = !DILocation(line: 97, column: 5, scope: !46)
!65 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 48, type: !13, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocalVariable(name: "data", scope: !65, file: !12, line: 50, type: !16)
!67 = !DILocation(line: 50, column: 12, scope: !65)
!68 = !DILocalVariable(name: "dataBuffer", scope: !65, file: !12, line: 51, type: !20)
!69 = !DILocation(line: 51, column: 10, scope: !65)
!70 = !DILocation(line: 52, column: 5, scope: !65)
!71 = !DILocation(line: 53, column: 5, scope: !65)
!72 = !DILocation(line: 53, column: 23, scope: !65)
!73 = !DILocation(line: 55, column: 12, scope: !65)
!74 = !DILocation(line: 55, column: 10, scope: !65)
!75 = !DILocalVariable(name: "source", scope: !76, file: !12, line: 57, type: !20)
!76 = distinct !DILexicalBlock(scope: !65, file: !12, line: 56, column: 5)
!77 = !DILocation(line: 57, column: 14, scope: !76)
!78 = !DILocation(line: 58, column: 9, scope: !76)
!79 = !DILocation(line: 59, column: 9, scope: !76)
!80 = !DILocation(line: 59, column: 23, scope: !76)
!81 = !DILocation(line: 61, column: 17, scope: !76)
!82 = !DILocation(line: 61, column: 9, scope: !76)
!83 = !DILocation(line: 63, column: 9, scope: !76)
!84 = !DILocation(line: 63, column: 21, scope: !76)
!85 = !DILocation(line: 64, column: 19, scope: !76)
!86 = !DILocation(line: 64, column: 9, scope: !76)
!87 = !DILocation(line: 66, column: 1, scope: !65)
