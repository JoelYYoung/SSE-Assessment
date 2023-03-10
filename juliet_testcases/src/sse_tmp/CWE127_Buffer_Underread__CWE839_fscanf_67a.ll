; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fscanf_67a.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fscanf_67a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct._CWE127_Buffer_Underread__CWE839_fscanf_67_structType = type { i32 }

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_fscanf_67_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %myStruct = alloca %struct._CWE127_Buffer_Underread__CWE839_fscanf_67_structType, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata %struct._CWE127_Buffer_Underread__CWE839_fscanf_67_structType* %myStruct, metadata !18, metadata !DIExpression()), !dbg !23
  store i32 -1, i32* %data, align 4, !dbg !24
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !25
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !26
  %1 = load i32, i32* %data, align 4, !dbg !27
  %structFirst = getelementptr inbounds %struct._CWE127_Buffer_Underread__CWE839_fscanf_67_structType, %struct._CWE127_Buffer_Underread__CWE839_fscanf_67_structType* %myStruct, i32 0, i32 0, !dbg !28
  store i32 %1, i32* %structFirst, align 4, !dbg !29
  %coerce.dive = getelementptr inbounds %struct._CWE127_Buffer_Underread__CWE839_fscanf_67_structType, %struct._CWE127_Buffer_Underread__CWE839_fscanf_67_structType* %myStruct, i32 0, i32 0, !dbg !30
  %2 = load i32, i32* %coerce.dive, align 4, !dbg !30
  call void @CWE127_Buffer_Underread__CWE839_fscanf_67b_badSink(i32 %2), !dbg !30
  ret void, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

declare dso_local void @CWE127_Buffer_Underread__CWE839_fscanf_67b_badSink(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_fscanf_67_good() #0 !dbg !32 {
entry:
  call void @goodG2B(), !dbg !33
  call void @goodB2G(), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !36 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !42, metadata !DIExpression()), !dbg !43
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !44, metadata !DIExpression()), !dbg !45
  %call = call i64 @time(i64* null) #4, !dbg !46
  %conv = trunc i64 %call to i32, !dbg !47
  call void @srand(i32 %conv) #4, !dbg !48
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !49
  call void @CWE127_Buffer_Underread__CWE839_fscanf_67_good(), !dbg !50
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !51
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !52
  call void @CWE127_Buffer_Underread__CWE839_fscanf_67_bad(), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !54
  ret i32 0, !dbg !55
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !56 {
entry:
  %data = alloca i32, align 4
  %myStruct = alloca %struct._CWE127_Buffer_Underread__CWE839_fscanf_67_structType, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata %struct._CWE127_Buffer_Underread__CWE839_fscanf_67_structType* %myStruct, metadata !59, metadata !DIExpression()), !dbg !60
  store i32 -1, i32* %data, align 4, !dbg !61
  store i32 7, i32* %data, align 4, !dbg !62
  %0 = load i32, i32* %data, align 4, !dbg !63
  %structFirst = getelementptr inbounds %struct._CWE127_Buffer_Underread__CWE839_fscanf_67_structType, %struct._CWE127_Buffer_Underread__CWE839_fscanf_67_structType* %myStruct, i32 0, i32 0, !dbg !64
  store i32 %0, i32* %structFirst, align 4, !dbg !65
  %coerce.dive = getelementptr inbounds %struct._CWE127_Buffer_Underread__CWE839_fscanf_67_structType, %struct._CWE127_Buffer_Underread__CWE839_fscanf_67_structType* %myStruct, i32 0, i32 0, !dbg !66
  %1 = load i32, i32* %coerce.dive, align 4, !dbg !66
  call void @CWE127_Buffer_Underread__CWE839_fscanf_67b_goodG2BSink(i32 %1), !dbg !66
  ret void, !dbg !67
}

declare dso_local void @CWE127_Buffer_Underread__CWE839_fscanf_67b_goodG2BSink(i32) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !68 {
entry:
  %data = alloca i32, align 4
  %myStruct = alloca %struct._CWE127_Buffer_Underread__CWE839_fscanf_67_structType, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata %struct._CWE127_Buffer_Underread__CWE839_fscanf_67_structType* %myStruct, metadata !71, metadata !DIExpression()), !dbg !72
  store i32 -1, i32* %data, align 4, !dbg !73
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !74
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !75
  %1 = load i32, i32* %data, align 4, !dbg !76
  %structFirst = getelementptr inbounds %struct._CWE127_Buffer_Underread__CWE839_fscanf_67_structType, %struct._CWE127_Buffer_Underread__CWE839_fscanf_67_structType* %myStruct, i32 0, i32 0, !dbg !77
  store i32 %1, i32* %structFirst, align 4, !dbg !78
  %coerce.dive = getelementptr inbounds %struct._CWE127_Buffer_Underread__CWE839_fscanf_67_structType, %struct._CWE127_Buffer_Underread__CWE839_fscanf_67_structType* %myStruct, i32 0, i32 0, !dbg !79
  %2 = load i32, i32* %coerce.dive, align 4, !dbg !79
  call void @CWE127_Buffer_Underread__CWE839_fscanf_67b_goodB2GSink(i32 %2), !dbg !79
  ret void, !dbg !80
}

declare dso_local void @CWE127_Buffer_Underread__CWE839_fscanf_67b_goodB2GSink(i32) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fscanf_67a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_fscanf_67_bad", scope: !12, file: !12, line: 30, type: !13, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fscanf_67a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 32, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 32, column: 9, scope: !11)
!18 = !DILocalVariable(name: "myStruct", scope: !11, file: !12, line: 33, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE127_Buffer_Underread__CWE839_fscanf_67_structType", file: !12, line: 23, baseType: !20)
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE127_Buffer_Underread__CWE839_fscanf_67_structType", file: !12, line: 20, size: 32, elements: !21)
!21 = !{!22}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !20, file: !12, line: 22, baseType: !16, size: 32)
!23 = !DILocation(line: 33, column: 58, scope: !11)
!24 = !DILocation(line: 35, column: 10, scope: !11)
!25 = !DILocation(line: 37, column: 12, scope: !11)
!26 = !DILocation(line: 37, column: 5, scope: !11)
!27 = !DILocation(line: 38, column: 28, scope: !11)
!28 = !DILocation(line: 38, column: 14, scope: !11)
!29 = !DILocation(line: 38, column: 26, scope: !11)
!30 = !DILocation(line: 39, column: 5, scope: !11)
!31 = !DILocation(line: 40, column: 1, scope: !11)
!32 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_fscanf_67_good", scope: !12, file: !12, line: 77, type: !13, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DILocation(line: 79, column: 5, scope: !32)
!34 = !DILocation(line: 80, column: 5, scope: !32)
!35 = !DILocation(line: 81, column: 1, scope: !32)
!36 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 92, type: !37, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{!16, !16, !39}
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!42 = !DILocalVariable(name: "argc", arg: 1, scope: !36, file: !12, line: 92, type: !16)
!43 = !DILocation(line: 92, column: 14, scope: !36)
!44 = !DILocalVariable(name: "argv", arg: 2, scope: !36, file: !12, line: 92, type: !39)
!45 = !DILocation(line: 92, column: 27, scope: !36)
!46 = !DILocation(line: 95, column: 22, scope: !36)
!47 = !DILocation(line: 95, column: 12, scope: !36)
!48 = !DILocation(line: 95, column: 5, scope: !36)
!49 = !DILocation(line: 97, column: 5, scope: !36)
!50 = !DILocation(line: 98, column: 5, scope: !36)
!51 = !DILocation(line: 99, column: 5, scope: !36)
!52 = !DILocation(line: 102, column: 5, scope: !36)
!53 = !DILocation(line: 103, column: 5, scope: !36)
!54 = !DILocation(line: 104, column: 5, scope: !36)
!55 = !DILocation(line: 106, column: 5, scope: !36)
!56 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 49, type: !13, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocalVariable(name: "data", scope: !56, file: !12, line: 51, type: !16)
!58 = !DILocation(line: 51, column: 9, scope: !56)
!59 = !DILocalVariable(name: "myStruct", scope: !56, file: !12, line: 52, type: !19)
!60 = !DILocation(line: 52, column: 58, scope: !56)
!61 = !DILocation(line: 54, column: 10, scope: !56)
!62 = !DILocation(line: 57, column: 10, scope: !56)
!63 = !DILocation(line: 58, column: 28, scope: !56)
!64 = !DILocation(line: 58, column: 14, scope: !56)
!65 = !DILocation(line: 58, column: 26, scope: !56)
!66 = !DILocation(line: 59, column: 5, scope: !56)
!67 = !DILocation(line: 60, column: 1, scope: !56)
!68 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocalVariable(name: "data", scope: !68, file: !12, line: 67, type: !16)
!70 = !DILocation(line: 67, column: 9, scope: !68)
!71 = !DILocalVariable(name: "myStruct", scope: !68, file: !12, line: 68, type: !19)
!72 = !DILocation(line: 68, column: 58, scope: !68)
!73 = !DILocation(line: 70, column: 10, scope: !68)
!74 = !DILocation(line: 72, column: 12, scope: !68)
!75 = !DILocation(line: 72, column: 5, scope: !68)
!76 = !DILocation(line: 73, column: 28, scope: !68)
!77 = !DILocation(line: 73, column: 14, scope: !68)
!78 = !DILocation(line: 73, column: 26, scope: !68)
!79 = !DILocation(line: 74, column: 5, scope: !68)
!80 = !DILocation(line: 75, column: 1, scope: !68)
